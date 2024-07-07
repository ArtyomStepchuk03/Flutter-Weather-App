import 'package:json_annotation/json_annotation.dart';

part 'forecast_units_dto.g.dart';

/// Системы измерений данных о погоде.
@JsonSerializable()
class ForecastUnitsDto {
  @JsonKey(name: 'temperature_2m')
  final String? temperature2m;
  @JsonKey(name: 'wind_speed_10m')
  final String? windSpeed10m;
  @JsonKey(name: 'relative_humidity_2m')
  final String? relativeHumidity2m;
  @JsonKey(name: 'pressure_msl')
  final String? pressure;
  @JsonKey(name: 'cloud_cover')
  final String? cloudCover;

  ForecastUnitsDto({
    required this.temperature2m,
    required this.windSpeed10m,
    required this.relativeHumidity2m,
    required this.pressure,
    required this.cloudCover,
  });

  factory ForecastUnitsDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastUnitsDtoFromJson(json);
}
