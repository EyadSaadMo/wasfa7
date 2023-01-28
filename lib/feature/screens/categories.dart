import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/provider/app_provider.dart';
import '../../core/provider/language_provider.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
     textDirection:  lan.isEn?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: Provider.of<MealProvider>(context).availableCategory
              .map(
                (catData) => CategoryItem(
                  id: catData.id,
                  color: catData.color,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
