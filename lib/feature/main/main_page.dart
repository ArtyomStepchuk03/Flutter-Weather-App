import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom_navigation/bottom_navigation_widget.dart';
import 'package:weather_app/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:weather_app/bottom_navigation/cubit/bottom_navigation_state.dart';
import 'package:weather_app/feature/forecast/cubit/forecast_cubit.dart';
import 'package:weather_app/feature/forecast/forecast_page.dart';
import 'package:weather_app/feature/profile/profile_page.dart';

/// Страница с информацией о текущей погоде.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildContent(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  /// Строит верхнюю полоску.
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('Flutter Weather App'),
    );
  }

  /// Строит наполнение страницы.
  Widget _buildContent(BuildContext context) {
    BottomNavigationState bottomNavigationState =
        context.watch<BottomNavigationCubit>().state;

    if (bottomNavigationState is ProfileBottomNavigationState) {
      return const ProfilePage();
    }

    return BlocProvider(
        create: (context) => ForecastCubit(), child: const ForecastPage());
  }

  /// Строит нижнюю навигационную панель.
  BottomNavigationWidget _buildBottomNavigationBar(BuildContext context) {
    return const BottomNavigationWidget();
  }
}
