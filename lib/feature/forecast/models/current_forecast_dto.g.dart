// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'current_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecastDto _$CurrentForecastDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CurrentForecastDto',
      json,
      ($checkedConvert) {
        final val = CurrentForecastDto(
          temperature2m:
              $checkedConvert('temperature_2m', (v) => (v as num?)?.toDouble()),
          windSpeed10m:
              $checkedConvert('wind_speed_10m', (v) => (v as num?)?.toDouble()),
          relativeHumidity2m: $checkedConvert(
              'relative_humidity_2m', (v) => (v as num?)?.toInt()),
          pressure:
              $checkedConvert('pressure_msl', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature2m': 'temperature_2m',
        'windSpeed10m': 'wind_speed_10m',
        'relativeHumidity2m': 'relative_humidity_2m',
        'pressure': 'pressure_msl'
      },
    );

Map<String, dynamic> _$CurrentForecastDtoToJson(CurrentForecastDto instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature2m,
      'wind_speed_10m': instance.windSpeed10m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'pressure_msl': instance.pressure,
    };
