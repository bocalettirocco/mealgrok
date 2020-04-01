import 'dart:async';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mealgrok/models/nutrient.dart';

class NutrientController {


  static Future<List<Nutrient>> getNutrients(DateTime day) {
    final List<Nutrient> data = [
      Nutrient(
        value: 100,
        units: 'mg',
        nutrientName: 'potassium',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 200,
        units: 'mg',
        nutrientName: 'sodium',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 100,
        units: 'mg',
        nutrientName: 'phosphorus',
        barColor: charts.ColorUtil.fromDartColor(Colors.green[200]),
      ),
      Nutrient(
        value: 80,
        units: 'g',
        nutrientName: 'protein',
        barColor: charts.ColorUtil.fromDartColor(Colors.red[200]),
      ),
      Nutrient(
        value: 100,
        units: 'g',
        nutrientName: 'sugar',
        barColor: charts.ColorUtil.fromDartColor(Colors.red[400]),
      ),
    ];

    return Future.delayed(const Duration(seconds: 1), () => data);
  }
}