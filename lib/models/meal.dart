import 'package:flutter/foundation.dart';
import 'package:mealgrok/models/food.dart';

class Meal {
  final DateTime dateAdded;
  final String name;
  List<Food> foods;

  Meal({
    @required this.name,
    @required this.dateAdded,
    @required this.foods,
  });
}