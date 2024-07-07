import 'package:flutter/material.dart';
import 'package:weather_app/feature/forecast/models/forecast_units_dto.dart';
import 'package:weather_app/feature/forecast/models/hourly_forecast_dto.dart';

/// Страница с делатьной информацией о прогнозе погоды.
class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {super.key,
      required this.dateTime,
      required this.index,
      required this.hourlyForecast,
      required this.forecastUnits});

  /// Дата и время прогноза.
  final String dateTime;

  /// Списки с данными о погоде.
  final HourlyForecastDto? hourlyForecast;

  /// Списки с данными о погоде.
  final ForecastUnitsDto? forecastUnits;

  /// Индекс элемента в списке.
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(dateTime),
      ),
      body: Padding(padding: const EdgeInsets.all(10), child: _buildContent()),
    );
  }

  /// Строит наполнение страницы сдетальной информацией о прогнозе погоды.
  Widget _buildContent() {
    double? temperature = hourlyForecast?.temperature2m?[index];
    String? temperatureUnit = forecastUnits?.temperature2m;

    double? windSpeed = hourlyForecast?.windSpeed10m?[index];
    String? windSpeedUnit = forecastUnits?.windSpeed10m;

    double? pressure = hourlyForecast?.pressure?[index];
    String? pressureUnit = forecastUnits?.pressure;

    int? cloudCover = hourlyForecast?.cloudCover?[index];
    String? cloudCoverUnit = forecastUnits?.cloudCover;

    int? humidity = hourlyForecast?.relativeHumidity2m?[index];
    String? humidityUnit = forecastUnits?.relativeHumidity2m;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWeatherParamInfo('Температура', temperature, temperatureUnit),
        _buildWeatherParamInfo('Скорость ветра', windSpeed, windSpeedUnit),
        _buildWeatherParamInfo('Давление', pressure, pressureUnit),
        _buildWeatherParamInfo('Облачность', cloudCover, cloudCoverUnit),
        _buildWeatherParamInfo('Влажноть', humidity, humidityUnit),
      ],
    );
  }

  /// Строит строку с информацией о текущем параметре.
  Widget _buildWeatherParamInfo(paramName, param, paramUnit) {
    if (param != null) {
      return Text(
        '$paramName: $param $paramUnit',
        style: const TextStyle(fontSize: 25),
      );
    }
    return Text('Параметр $paramName неизвестен');
  }
}
