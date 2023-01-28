//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../feature/models/categories_model.dart';
// import '../../feature/models/dummy_data_model.dart';
// import '../../feature/models/meal_model.dart';
//
//
// class AppProvider with ChangeNotifier {
//   Map<String, bool> filters = {
//     'gluten': false,
//     'lactose': false,
//     'vegan': false,
//     'vegetarian': false,
//   };
//
//   List<Meal> availableMeals = DUMMY_MEALS;
//   List<Meal> favoriteMeals = [];
//
//   List<String> prefsMealId = [];
//
//   List<Category> availableCategory = [];
//
//   void setFilters() async {
//     availableMeals = DUMMY_MEALS.where((meal) {
//       if (filters['gluten']! && !meal.isGlutenFree) {
//         return false;
//       }
//       if (filters['lactose']! && !meal.isLactoseFree) {
//         return false;
//       }
//       if (filters['vegan']! && !meal.isVegan) {
//         return false;
//       }
//       if (filters['vegetarian']! && !meal.isVegetarian) {
//         return false;
//       }
//       return true;
//     }).toList();
//
//     List<Category> ac = [];
//     availableMeals.forEach((meal) {
//       meal.categories.forEach((catId) {
//         DUMMY_CATEGORIES.forEach((cat) {
//           if (cat.id == catId) {
//             if (!ac.any((cat) => cat.id == catId)) ac.add(cat);
//           }
//         });
//       });
//     });
//     availableCategory = ac;
//
//     notifyListeners();
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool("gluten", filters['gluten']!);
//     prefs.setBool("lactose", filters['lactose']!);
//     prefs.setBool("vegan", filters['vegan']!);
//     prefs.setBool("vegetarian", filters['vegetarian']!);
//   }
//
//   void getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     filters['gluten'] = prefs.getBool("gluten") ?? false;
//     filters['lactose'] = prefs.getBool("lactose") ?? false;
//     filters['vegan'] = prefs.getBool("vegan") ?? false;
//     filters['vegetarian'] = prefs.getBool("vegetarian") ?? false;
//     setFilters();
//
//     prefsMealId = prefs.getStringList("prefsMealId") ?? [];
//     for (var mealId in prefsMealId) {
//       final existingIndex =
//       favoriteMeals.indexWhere((meal) => meal.id == mealId);
//       if (existingIndex < 0) {
//         favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
//       }
//     }
//
//     List<Meal> fm = [];
//     favoriteMeals.forEach((favMeals) {
//       availableMeals.forEach((avMeals) {
//         if(favMeals.id == avMeals.id) fm.add(favMeals);
//       });
//     });
//     favoriteMeals = fm;
//
//     notifyListeners();
//   }
//
//   void toggleFavorite(String mealId) async {
//     final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
//     if (existingIndex >= 0) {
//       favoriteMeals.removeAt(existingIndex);
//       prefsMealId.remove(mealId);
//     } else {
//       favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
//       prefsMealId.add(mealId);
//     }
//
//     notifyListeners();
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setStringList("prefsMealId", prefsMealId);
//   }
//
//   bool isMealFavorite(String mealId) {
//     return favoriteMeals.any((meal) => meal.id == mealId);
//   }
// }

import 'package:akht2r/feature/models/categories_model.dart';
import 'package:flutter/material.dart';

import '../../feature/models/dummy_data_model.dart';
import '../../feature/models/meal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MealProvider with ChangeNotifier{
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Category> availableCategory = [];
  List<Meal> favoriteMeals = [];
  List <String> prefsMealId = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  setFilters()async {
      availableMeals=DUMMY_MEALS .where((meal){
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
      List<Category> ac=[];
      for (var meal in availableMeals) {
        for (var catId in meal.categories) {
          for (var cat in DUMMY_CATEGORIES) {
            if(cat.id == catId){
              if(!ac.any((cat) => cat.id == catId)){
                ac.add(cat);

              }
            }
          }
        }
      }
      availableCategory=ac;
      notifyListeners();
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setBool('gluten', filters['gluten']!);
      prefs.setBool('lactose', filters['lactose']!);
      prefs.setBool('vegan', filters['vegan']!);
      prefs.setBool('vegetarian', filters['vegetarian']!);

  }
  void getData()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    filters['gluten']=  prefs.getBool('gluten')??false;
    filters['lactose']= prefs.getBool('lactose')??false;
     filters['vegan']=  prefs.getBool('vegan')??false;
     filters['vegetarian']=prefs.getBool('vegetarian')??false;
    setFilters();
    prefsMealId = prefs.getStringList('prefsMealId')??[];
    notifyListeners();

    for(var mealId in prefsMealId){
     final existingId =  favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if(existingId < 0){
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }
    notifyListeners();
    List<Meal> fm = [];
    favoriteMeals.forEach((favMeals) {
      availableMeals.forEach((avMeals) {
        if(favMeals.id == avMeals.id) fm.add(favMeals);
      });
    });
    favoriteMeals = fm;

    notifyListeners();


  }

  void toggleFavorite(String mealId)async {
    final existingIndex =
    favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0)
    {
        favoriteMeals.removeAt(existingIndex);
        prefsMealId.remove(mealId);
        notifyListeners();
    } else {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
    }
    prefsMealId.add(mealId);
    notifyListeners();

    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setStringList('prefsMealId', prefsMealId);
  }
  /// i made this to change icon
  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

}
