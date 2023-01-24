import 'package:akht2r/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/meal_model.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeals = Provider.of<AppProvider>(context,listen: true).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return MealItem(
                    imageUrl: favoriteMeals[index].imageUrl,
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    duration: favoriteMeals[index].duration,
                    complexity: favoriteMeals[index].complexity,
                    affordability: favoriteMeals[index].affordability,
                    // removeItem: removeMeal,
                  );
                },
                itemCount: favoriteMeals.length,
              ),
            ],
          ),
        ),

      );
    }
  }
}
