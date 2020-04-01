import 'package:flutter/foundation.dart';
import 'package:mealgrok/models/nutrient.dart';

class Food {
  final String name;
  final List<Nutrient> nutrients;

  Food({
    @required this.name,
    @required this.nutrients,
  });
}