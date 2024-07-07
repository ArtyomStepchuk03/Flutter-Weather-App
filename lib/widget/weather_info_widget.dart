import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/feature/forecast/details_page.dart';
import 'package:weather_app/feature/forecast/models/forecast_units_dto.dart';
import 'package:weather_app/feature/forecast/models/hourly_forecast_dto.dart';
import 'package:weather_app/utils/temperature_to_color_converter.dart';

/// Виджет с числовым обозначением температуры и текущего погодного состояния.
class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({
    super.key,
    required this.forecastUnits,
    required this.index,
    required this.hourlyForecast,
  });

  /// Системы измерения.
  final ForecastUnitsDto? forecastUnits;

  final HourlyForecastDto? hourlyForecast;

  final int index;

  @override
  Widget build(BuildContext context) {
    double? temperature = hourlyForecast?.temperature2m?[index];
    int timestamp = hourlyForecast?.time?[index] ?? 0;

    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedDate = DateFormat('dd.MM HH:mm').format(date);

    return InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  dateTime: formattedDate,
                  index: index,
                  hourlyForecast: hourlyForecast,
                  forecastUnits: forecastUnits,
                ),
              ),
            ),
        child: _buildContent(formattedDate, temperature));
  }

  Widget _buildContent(String dateTime, double? temperature) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 50,
          color: Colors.white.withAlpha(128),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                dateTime,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  if (temperature != null)
                    Icon(
                      Icons.thermostat,
                      color: TemperatureToColorConverter.convert(temperature),
                      size: 40,
                    ),
                  Text(
                    '${temperature.toString()} ${forecastUnits?.temperature2m}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
