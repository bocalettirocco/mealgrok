import 'dart:async';
import 'package:mealgrok/models/meal.dart';
import 'package:mealgrok/controllers/food_controller.dart';

class MealController {

  static Future<List<Meal>> getMeals(DateTime day) async {
    final List<Meal> data = [
      Meal(
        name: 'Scrambled Eggs',
        dateAdded: day,
        foods: await FoodController.getFoods(DateTime.now()),
      ),
      Meal(
        name: 'Steak and Potatoes',
        dateAdded: day,
        foods: await FoodController.getFoods(DateTime.now()),
      ),
      Meal(
        name: 'Gumbo',
        dateAdded: day,
        foods: await FoodController.getFoods(DateTime.now()),
      ),
    ];
    print('returning data from meal controller');
    return Future.delayed(const Duration(milliseconds: 3), () => data);
  }
}