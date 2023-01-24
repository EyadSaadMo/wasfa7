import 'package:akht2r/core/provider/app_provider.dart';
import 'package:akht2r/core/styles/styles.dart';
import 'package:akht2r/feature/screens/filter_screen.dart';
import 'package:akht2r/feature/screens/meal_detils_screen.dart';
import 'package:akht2r/feature/screens/tab_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feature/screens/category_meals_screen.dart';

void main() {
  runApp(
    /// to use appProvider inside all app
      ChangeNotifierProvider<AppProvider>(
        create:(ctx)=>AppProvider(),
        child:const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'wasfa7',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=> TabsScreen(),
        CategoryMealsScreen.routeName : (context)=> CategoryMealsScreen(),
        MealDetailsScreen.routeName : (context)=> MealDetailsScreen(),
        FiltersScreen.routeName : (context)=> FiltersScreen(),
      },
    );
  }
}