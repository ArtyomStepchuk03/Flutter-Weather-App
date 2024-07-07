import 'package:get_it/get_it.dart';
import 'package:weather_app/repository/forecast/forecast_repository.dart';
import 'package:weather_app/repository/forecast/forecast_repository_client.dart';

/// Di-контроллер.
class DiHandler {
  /// Регистрирует зависимости в DI.
  static Future<void> configureDi() async {
    final getIt = GetIt.I;

    getIt.registerSingleton<IForecastRepository>(ForecastRepositoryClient());
  }
}
