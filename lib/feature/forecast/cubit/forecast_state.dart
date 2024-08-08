part of 'forecast_cubit.dart';

/// Состояние страницы с прогнозом погоды.
abstract class ForecastState {}

/// Состояние страницы с прогнозом погоды при инициализации.
class InitialForecastState extends ForecastState {}

/// Состояние страницы с прогнозом погоды при загрузке данных из сервера.
class LoadingForecastState extends ForecastState {}

/// Состояние страницы с прогнозом погоды при успешной загрузке данных из сервера.
class SuccessForecastState extends ForecastState {
  SuccessForecastState(this.forecastData);

  final ForecastDto forecastData;
}

/// Состояние страницы с прогнозом погоды при ошибке
class ErrorForecastState extends ForecastState {
  ErrorForecastState(this.errorMessage);

  final String errorMessage;
}
