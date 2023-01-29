import 'package:flutter/material.dart';

import '../../core/provider/language_provider.dart';
import '../screens/category_meals_screen.dart';
import 'package:provider/provider.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;

  const CategoryItem({Key? key, required this.id,  required this.color}) : super(key: key);


  void selectCategory (BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,arguments: {
      'id':id,
    });
  }
  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: true);

    return InkWell(
       onTap: () => selectCategory(context),
      splashColor: Theme.of(context).appBarTheme.backgroundColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
        lan.getTexts('cat-$id'),style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
