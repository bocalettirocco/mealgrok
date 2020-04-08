import 'dart:async';
import 'package:mealgrok/models/food.dart';
import 'package:mealgrok/controllers/nutrient_controller.dart';

class FoodController {

  static Future<List<Food>> getFoods(DateTime day) async {
    final List<Food> data = [
      Food(
        name: 'Eggs',
        nutrients: await NutrientController.getNutrients(day)
      ),
      Food(
        name: 'Potato',
        nutrients: await NutrientController.getNutrients(day)
      ),
      Food(
        name: 'Chicken Wing',
        nutrients: await NutrientController.getNutrients(day)
      ),
    ];
    
    return Future.delayed(const Duration(milliseconds: 1), () => data);
  }
}