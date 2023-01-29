import 'package:akht2r/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/provider/language_provider.dart';
import '../models/meal_model.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: true);

    var deviceWidth = MediaQuery.of(context).size.width;

    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    final List<Meal> favoriteMeals = Provider.of<MealProvider>(context,listen: true).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return  Center(
        child: Text(lan.getTexts('favorites_text'),style: Theme.of(context).textTheme.bodyText2,),
      );
    }else {
      return Directionality(
          textDirection:  lan.isEn?TextDirection.ltr:TextDirection.rtl,
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: deviceWidth <= 400 ? 400:500,
                  childAspectRatio: isLandScape? deviceWidth/(deviceWidth*1.07) :deviceWidth/(deviceWidth*0.99),
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return MealItem(
                    imageUrl: favoriteMeals[index].imageUrl,
                    id: favoriteMeals[index].id,
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

      ));
    }
  }
}
