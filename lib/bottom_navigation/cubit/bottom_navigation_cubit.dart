import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom_navigation/bottom_navigation_widget.dart';
import 'package:weather_app/bottom_navigation/cubit/bottom_navigation_state.dart';

/// Кубит для обработки перехода между страницами.
class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(InitialBottomNavigationState());

  /// Сообщает приложению, что надо сменить страницу.
  void navigate(BottomNavigationRange selectedPageType) {
    switch (selectedPageType) {
      case BottomNavigationRange.forecast:
        emit(ForecastBottomNavigationState());
      case BottomNavigationRange.profile:
        emit(ProfileBottomNavigationState());
    }
  }
}
