import 'package:akht2r/feature/models/dummy_data_model.dart';
import 'package:akht2r/feature/widget/build_container_item.dart';
import 'package:flutter/material.dart';
import '../../core/provider/app_provider.dart';
import '../widget/build_title_items.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
           buildSectionTitle(context, 'Ingredients'),
           buildContainer(ListView.builder(
             itemBuilder: (ctx, index) {
               return Card(
                   color: Theme.of(context).appBarTheme.backgroundColor,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     child: Text(selectedMeal.ingredients[index],style: Theme.of(context).textTheme.bodyText1,),
                   ));
             },
             itemCount: selectedMeal.ingredients.length,
           ),),
            buildSectionTitle(context, 'Steps'),
            buildContainer( ListView.builder(
              itemBuilder: (ctx, index) => Container(
                decoration: BoxDecoration(
                  color:  Theme.of(context).appBarTheme.backgroundColor,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundColor: Theme.of(context).textTheme.bodyText1!.color ,
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(height: 1,color: Colors.white,)
                  ],
                ),
              ),
              itemCount: selectedMeal.steps.length,
            ),),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Provider.of<AppProvider>(context,listen: true).isMealFavorite(mealId)? Icons.star : Icons.star_border,
        ),

        onPressed: (){Provider.of<AppProvider>(context,listen: false).toggleFavorite(mealId);},
      ),
    );
  }

}
