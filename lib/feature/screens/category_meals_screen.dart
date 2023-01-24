
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
  String? catTitle;
  List<Meal>? displayedMeals;
  void removeMeal(String mealId){
    setState(() {
      displayedMeals!.removeWhere((element) => element.id ==mealId);
    });
  }
  @override
  void didChangeDependencies() {
    final List<Meal> availableMeals= Provider.of<AppProvider>(context,listen: true).availableMeals;

    final routeArg =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
    catTitle = routeArg['title']!;
    displayedMeals = availableMeals.where((meals) {
      return meals.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        title: Text(catTitle!,style: Theme.of(context).appBarTheme.titleTextStyle
          ,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return MealItem(
                  imageUrl: displayedMeals![index].imageUrl,
                  id: displayedMeals![index].id,
                  title: displayedMeals![index].title,
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

    );
  }
}
