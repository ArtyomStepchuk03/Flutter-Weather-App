import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/feature/forecast/models/forecast_dto.dart';
import 'package:weather_app/repository/forecast/forecast_repository.dart';

part 'forecast_repository_client.g.dart';

/// Репозиторий для получения прогноза погоды и текущей температуры.
@RestApi(baseUrl: 'https://api.open-meteo.com/v1')
abstract class ForecastRepositoryClient implements IForecastRepository {
  factory ForecastRepositoryClient() => _ForecastRepositoryClient(Dio());

  /// Получает прогноз погоды.
  @override
  @GET('/forecast')
  Future<ForecastDto>? getForecast(
    @Query('latitude') String latitude,
    @Query('longitude') String longitude, {
    @Query('current') String currentParams =
        'temperature_2m,relative_humidity_2m,wind_speed_10m,pressure_msl',
    @Query('hourly') String hourlyParams =
        'temperature_2m,relative_humidity_2m,wind_speed_10m,pressure_msl,cloud_cover',
    @Query('timeformat') String timeFormat = 'unixtime',
    @Query('timezone') String timezone = 'Europe/Moscow',
    @Query('wind_speed_unit') String windSpeedUnit = 'ms',
  });
}
