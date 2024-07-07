import 'package:json_annotation/json_annotation.dart';

part 'current_forecast_dto.g.dart';

/// Текущие данные о погоде.
@JsonSerializable()
class CurrentForecastDto {
  @JsonKey(name: 'temperature_2m')
  final double? temperature2m;
  @JsonKey(name: 'wind_speed_10m')
  final double? windSpeed10m;
  @JsonKey(name: 'relative_humidity_2m')
  final int? relativeHumidity2m;
  @JsonKey(name: 'pressure_msl')
  final double? pressure;

  CurrentForecastDto({
    required this.temperature2m,
    required this.windSpeed10m,
    required this.relativeHumidity2m,
    required this.pressure,
  });

  factory CurrentForecastDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentForecastDtoFromJson(json);
}
