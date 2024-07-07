import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:weather_app/feature/main/main_page.dart';
import 'package:weather_app/infrastructure/di/di_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiHandler.configureDi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => BottomNavigationCubit(),
          child: const MainPage()),
    );
  }
}
