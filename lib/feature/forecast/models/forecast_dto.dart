import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/feature/forecast/models/current_forecast_dto.dart';
import 'package:weather_app/feature/forecast/models/hourly_forecast_dto.dart';
import 'package:weather_app/feature/forecast/models/forecast_units_dto.dart';

part 'forecast_dto.g.dart';

/// DTO с прогнозом погоды и системами измерения.
@JsonSerializable()
class ForecastDto {
  @JsonKey(name: 'hourly_units')
  final ForecastUnitsDto? forecastUnits;
  @JsonKey(name: 'current')
  final CurrentForecastDto? currentForecastData;
  @JsonKey(name: 'hourly')
  final HourlyForecastDto? hourlyForecastData;

  ForecastDto({
    required this.forecastUnits,
    required this.currentForecastData,
    required this.hourlyForecastData,
  });

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);
}
