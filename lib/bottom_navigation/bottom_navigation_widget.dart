import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom_navigation/cubit/bottom_navigation_cubit.dart';

/// Нижняя панель навигации.
class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

/// Состояние нижней панели навигации.
class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  /// Индекс выбранного элемента нижней панели навигации.
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) => _onNavigationTap(index),
        currentIndex: selectedItemIndex,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Прогноз погоды',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ]);
  }

  /// Обработчик изменения выбранной страницы
  void _onNavigationTap(int index) {
    context
        .read<BottomNavigationCubit>()
        .navigate(BottomNavigationRange.values[index]);
    setState(() => selectedItemIndex = index);
  }
}

/// Варианты выбора кнопок для нижней панели навигации.
enum BottomNavigationRange {
  forecast,
  profile,
}
