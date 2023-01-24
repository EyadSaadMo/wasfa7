import 'package:flutter/material.dart';

import '../../feature/models/dummy_data_model.dart';
import '../../feature/models/meal_model.dart';

class AppProvider with ChangeNotifier{
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  setFilters() {
      availableMeals .where((meal){
        if(filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      notifyListeners();

  }


  void toggleFavorite(String mealId) {
    final existingIndex =
    favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0)
    {
        favoriteMeals.removeAt(existingIndex);
        notifyListeners();
    } else {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
        notifyListeners();
    }
  }
  /// i made this to change icon
  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

}