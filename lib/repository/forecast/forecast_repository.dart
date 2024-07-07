import 'package:weather_app/feature/forecast/models/forecast_dto.dart';

/// Репозиторий для получения прогноза погоды и текущей температуры.
abstract class IForecastRepository {
  /// Получает прогноз погоды.
  Future<ForecastDto>? getForecast(
    String latitude,
    String longitude,
  );
}
