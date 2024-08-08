import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/feature/forecast/models/forecast_dto.dart';
import 'package:weather_app/repository/forecast/forecast_repository.dart';

part 'forecast_state.dart';

/// Кубит для страницы с прогнозом погоды.
class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit() : super(InitialForecastState());

  /// Загружает данные с сервера.
  Future<void> loadForecastFromServer() async {
    emit(LoadingForecastState());
    try {
      final ForecastDto? forecast = await GetIt.I
          .get<IForecastRepository>()
          .getForecast('55.7558', '37.6176');

      if (forecast == null) {
        emit(ErrorForecastState('На сервере нет данных по вашему запросу!'));
      }

      emit(SuccessForecastState(forecast!));
    } catch (e) {
      emit(ErrorForecastState(
          'Ошибка при загрузке данных! Повторите попытку позже.'));
    }
  }
}
