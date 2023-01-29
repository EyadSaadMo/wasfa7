import 'package:akht2r/core/provider/app_provider.dart';
import 'package:akht2r/core/provider/language_provider.dart';
import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/core/styles/styles.dart';
import 'package:akht2r/feature/screens/filter_screen.dart';
import 'package:akht2r/feature/screens/meal_detils_screen.dart';
import 'package:akht2r/feature/screens/on_boarding_screen.dart';
import 'package:akht2r/feature/screens/tab_screen.dart';
import 'package:akht2r/feature/screens/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feature/screens/category_meals_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget homeScreen = prefs.getBool('watched')??false?const TabsScreen():const OnBoardingScreen();
 // prefs.clear();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(create: (ctx) => MealProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(create: (ctx) => LanguageProvider()),
      ],
      child:  MyApp(homeScreen),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget mainScreen;
  const MyApp(this.mainScreen,{super.key});

  @override
  Widget build(BuildContext context) {

    var tm= Provider.of<ThemeProvider>(context,listen: true).tm;
    var lan = Provider.of<LanguageProvider>(context,listen: true);
    return Directionality(
      textDirection: lan.isEn ?TextDirection.ltr:TextDirection.rtl,
      child: MaterialApp(
        title: 'wasfa7',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: tm,
        debugShowCheckedModeBanner: false,
        // home: const CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => mainScreen,
          TabsScreen.routeName: (context) => TabsScreen(),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(),
          ThemeScreen.routeName: (context) => ThemeScreen(),
        },
      ),
    );
  }
}
