import 'package:akht2r/core/provider/app_provider.dart';
import 'package:akht2r/core/provider/language_provider.dart';
import 'package:akht2r/core/provider/theme_provider.dart';
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
    var primaryColor= Provider.of<ThemeProvider>(context,listen: true).primaryColor;
    var accentColor= Provider.of<ThemeProvider>(context,listen: true).accentColor;
    var tm= Provider.of<ThemeProvider>(context,listen: true).tm;
    var lan = Provider.of<LanguageProvider>(context,listen: true);
    return Directionality(
      textDirection: lan.isEn ?TextDirection.ltr:TextDirection.rtl,
      child: MaterialApp(
        title: 'wasfa7',
        theme: ThemeData(
          primarySwatch:primaryColor,
          accentColor: accentColor,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
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
