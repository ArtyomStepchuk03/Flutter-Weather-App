import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/forecast/cubit/forecast_cubit.dart';
import 'package:weather_app/feature/forecast/models/current_forecast_dto.dart';
import 'package:weather_app/feature/forecast/models/forecast_units_dto.dart';
import 'package:weather_app/feature/forecast/models/hourly_forecast_dto.dart';
import 'package:weather_app/utils/temperature_to_color_converter.dart';
import 'package:weather_app/widget/loading_indicator_widget.dart';
import 'package:weather_app/widget/weather_info_widget.dart';

/// Страница с прогнозом погоды и данными о текущей температуре.
class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForecastState forecastState = context.watch<ForecastCubit>().state;

    if (forecastState is InitialForecastState) {
      context.read<ForecastCubit>().loadForecastFromServer();
    }

    if (forecastState is ErrorForecastState) {
      return _buildErrorWidget(forecastState);
    }

    if (forecastState is LoadingForecastState) {
      return const LoadingIndicatorWidget();
    }

    if (forecastState is SuccessForecastState) {
      return _buildContent(context, forecastState);
    }

    return Container();
  }

  /// Строит виджет с сообщением об ошибке.
  Widget _buildErrorWidget(ErrorForecastState errorState) {
    return Center(
      child: Text(
        errorState.errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }

  /// Строит наполнение страницы с прогнозом погоды.
  Widget _buildContent(BuildContext context, SuccessForecastState state) {
    return RefreshIndicator(
      onRefresh: () => context.read<ForecastCubit>().loadForecastFromServer(),
      child: Column(
        children: [
          Expanded(
            child: _buildCurrentWeatherInfoWidget(state),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            flex: 4,
            child: _buildWeekForecastWidget(state),
          ),
        ],
      ),
    );
  }

  /// Строит виджет с информацией о погоде в настоящий момент.
  Widget _buildCurrentWeatherInfoWidget(SuccessForecastState state) {
    CurrentForecastDto? currentForecastData =
        state.forecastData.currentForecastData;
    ForecastUnitsDto? forecastUnits = state.forecastData.forecastUnits;

    final double? temperature = currentForecastData?.temperature2m;
    final String? temperatureUnit = forecastUnits?.temperature2m;

    final int? humidity = currentForecastData?.relativeHumidity2m;
    final String? humidityUnit = forecastUnits?.relativeHumidity2m;

    final double? pressure = currentForecastData?.pressure;
    final String? pressureUnit = forecastUnits?.pressure;

    return Container(
        color: Colors.blue.withAlpha(120),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Москва',
                  ),
                  Text('Давление: $pressure $pressureUnit'),
                  Text('Влажность: $humidity $humidityUnit')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (temperature != null)
                  Icon(
                    Icons.thermostat,
                    color: TemperatureToColorConverter.convert(temperature),
                    size: 50,
                  ),
                Text(
                  '${temperature.toString()} $temperatureUnit',
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            ),
          ],
        ));
  }

  /// Строит список с прогнозируемыми данными.
  Widget _buildWeekForecastWidget(SuccessForecastState state) {
    HourlyForecastDto? hourlyForecastData =
        state.forecastData.hourlyForecastData;

    ForecastUnitsDto? forecastUnits = state.forecastData.forecastUnits;

    if (hourlyForecastData == null || forecastUnits == null) {
      return const SizedBox();
    }

    return Container(
      color: Colors.blue.withAlpha(90),
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: hourlyForecastData.time?.length,
        itemBuilder: (context, index) => WeatherInfoWidget(
            forecastUnits: forecastUnits,
            hourlyForecast: hourlyForecastData,
            index: index),
      ),
    );
  }
}
