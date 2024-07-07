// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'forecast_units_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastUnitsDto _$ForecastUnitsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ForecastUnitsDto',
      json,
      ($checkedConvert) {
        final val = ForecastUnitsDto(
          temperature2m: $checkedConvert('temperature_2m', (v) => v as String?),
          windSpeed10m: $checkedConvert('wind_speed_10m', (v) => v as String?),
          relativeHumidity2m:
              $checkedConvert('relative_humidity_2m', (v) => v as String?),
          pressure: $checkedConvert('pressure_msl', (v) => v as String?),
          cloudCover: $checkedConvert('cloud_cover', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature2m': 'temperature_2m',
        'windSpeed10m': 'wind_speed_10m',
        'relativeHumidity2m': 'relative_humidity_2m',
        'pressure': 'pressure_msl',
        'cloudCover': 'cloud_cover'
      },
    );

Map<String, dynamic> _$ForecastUnitsDtoToJson(ForecastUnitsDto instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature2m,
      'wind_speed_10m': instance.windSpeed10m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'pressure_msl': instance.pressure,
      'cloud_cover': instance.cloudCover,
    };
