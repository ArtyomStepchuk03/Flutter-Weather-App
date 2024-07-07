// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'hourly_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastDto _$HourlyForecastDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HourlyForecastDto',
      json,
      ($checkedConvert) {
        final val = HourlyForecastDto(
          time: $checkedConvert(
              'time',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          temperature2m: $checkedConvert(
              'temperature_2m',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList()),
          windSpeed10m: $checkedConvert(
              'wind_speed_10m',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList()),
          relativeHumidity2m: $checkedConvert(
              'relative_humidity_2m',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          pressure: $checkedConvert(
              'pressure_msl',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList()),
          cloudCover: $checkedConvert(
              'cloud_cover',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
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

Map<String, dynamic> _$HourlyForecastDtoToJson(HourlyForecastDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'wind_speed_10m': instance.windSpeed10m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'pressure_msl': instance.pressure,
      'cloud_cover': instance.cloudCover,
    };
