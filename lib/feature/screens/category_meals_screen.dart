import 'package:akht2r/core/provider/language_provider.dart';
import 'package:akht2r/feature/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/provider/app_provider.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? catId;
  List<Meal>? displayedMeals;

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    final List<Meal> availableMeals =
        Provider.of<MealProvider>(context, listen: true).availableMeals;

    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    catId = routeArg['id'];
    displayedMeals = availableMeals.where((meals) {
      return meals.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: true);
    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection:  lan.isEn?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        title: Text(
          lan.getTexts('cat-$catId'),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: deviceWidth <= 400 ? 400:500,
                childAspectRatio: isLandScape? deviceWidth/(deviceWidth*1.06) :deviceWidth/(deviceWidth*0.95),
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return MealItem(
                  imageUrl: displayedMeals![index].imageUrl,
                  id: displayedMeals![index].id,
                  duration: displayedMeals![index].duration,
                  complexity: displayedMeals![index].complexity,
                  affordability: displayedMeals![index].affordability,
                  // removeItem: removeMeal,
                );
              },
              itemCount: displayedMeals!.length,
            ),
          ],
        ),
      ),
    ));
  }
}
