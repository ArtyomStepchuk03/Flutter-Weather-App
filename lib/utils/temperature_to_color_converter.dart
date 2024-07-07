import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/// Преобразователь значения температуры в цветовой индикатор.
class TemperatureToColorConverter {
  /// Преобразует значение температуры в цветовой индикатор.
  static Color convert(double temperature) {
    if (temperature == 0) {
      return Colors.white;
    }

    late Color result;
    if (temperature > 0) {
      result = Colors.red;
    } else {
      result = Colors.blue;
    }

    return result.withAlpha(_computeAlpha(temperature));
  }

  /// Вычисляет параметр "альфа" для изменения цвета объекта.
  static int _computeAlpha(double temperature) {
    temperature = temperature.abs();

    int result = 40 + (temperature / 2 * 15).toInt();

    return min(result, 255);
  }
}
