// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ForecastDto',
      json,
      ($checkedConvert) {
        final val = ForecastDto(
          forecastUnits: $checkedConvert(
              'hourly_units',
              (v) => v == null
                  ? null
                  : ForecastUnitsDto.fromJson(v as Map<String, dynamic>)),
          currentForecastData: $checkedConvert(
              'current',
              (v) => v == null
                  ? null
                  : CurrentForecastDto.fromJson(v as Map<String, dynamic>)),
          hourlyForecastData: $checkedConvert(
              'hourly',
              (v) => v == null
                  ? null
                  : HourlyForecastDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'forecastUnits': 'hourly_units',
        'currentForecastData': 'current',
        'hourlyForecastData': 'hourly'
      },
    );

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'hourly_units': instance.forecastUnits,
      'current': instance.currentForecastData,
      'hourly': instance.hourlyForecastData,
    };
