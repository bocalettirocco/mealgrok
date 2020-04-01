import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Nutrient {
  final int value;
  final String nutrientName;
  final String units;
  final charts.Color barColor;

  Nutrient({
    @required this.value,
    @required this.nutrientName,
    @required this.units,
    this.barColor,
  });
}