import 'package:json_annotation/json_annotation.dart';

part 'hourly_forecast_dto.g.dart';

/// Текущие данные о погоде.
@JsonSerializable()
class HourlyForecastDto {
  final List<int>? time;
  @JsonKey(name: 'temperature_2m')
  final List<double>? temperature2m;
  @JsonKey(name: 'wind_speed_10m')
  final List<double>? windSpeed10m;
  @JsonKey(name: 'relative_humidity_2m')
  final List<int>? relativeHumidity2m;
  @JsonKey(name: 'pressure_msl')
  final List<double>? pressure;
  @JsonKey(name: 'cloud_cover')
  final List<int>? cloudCover;

  HourlyForecastDto({
    required this.time,
    required this.temperature2m,
    required this.windSpeed10m,
    required this.relativeHumidity2m,
    required this.pressure,
    required this.cloudCover,
  });

  factory HourlyForecastDto.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastDtoFromJson(json);
}
