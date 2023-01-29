import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../colors/colors.dart';

ThemeData lightTheme= ThemeData(
    canvasColor:screenColor,

    primaryIconTheme: const IconThemeData(
    color: Colors.pink
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    caption: TextStyle(
      fontSize: 10.0,
      fontFamily: 'RobotoCondensed',

      fontWeight: FontWeight.w600,
      color: textColor,
      height: 1.3,
    ),
    bodyText2: const TextStyle(
      color: Colors.pink,
      fontFamily: 'RobotoCondensed',

      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontFamily: 'RobotoCondensed',

      color: textColor,
      height: 1,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: defaultColor,
  ),
  // ده بيغير كل حاجه معاك في ال app
  primarySwatch:  Colors.pink,
  //عشان أغير لون ال scaffold في الكل
  scaffoldBackgroundColor:screenColor,
  // first thing
  appBarTheme: AppBarTheme(
    // titleSpacing: 20.0,
    // فيها حاجات تنطبق على ال app bar اللي في ال app كله
    backgroundColor:defaultColor,
    elevation: 0.0,

    // عاوز بقا أغير ال status bar
    // backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: appBarTitle,
    ),
    // عشان أعدل في لون الحاجات اللي في ال action جوه ال app bar
    iconTheme: const IconThemeData(
      color: Colors.pink,
    ),
    // عملته false عشان اعرف اتحكم في ال status bar
    systemOverlayStyle:  SystemUiOverlayStyle(
      statusBarColor: defaultColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: screenColor,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    //عاوز أغير في لون ال Button nav bar
    backgroundColor: defaultColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: defaultColor,
    border: InputBorder.none,
    suffixIconColor: textColor,
    hintStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: textColor,
      height: 1.3,
    ),

  ),
  iconTheme: const IconThemeData(
      color: Colors.white,
  ),
  cardTheme: CardTheme(
    color: defaultColor
  ),
  unselectedWidgetColor: Colors.black,
radioTheme: RadioThemeData(
  fillColor: MaterialStateColor.resolveWith((states) => defaultColor),
  overlayColor: MaterialStateColor.resolveWith((states) => defaultColor),
)
);
ThemeData darkTheme= ThemeData(
  canvasColor: HexColor('333739'),
  primaryColor: Colors.black,
  cardTheme: CardTheme(
      color: HexColor('333739')
  ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => screenColor),
      overlayColor: MaterialStateColor.resolveWith((states) => defaultColor),
    ),
  scaffoldBackgroundColor: HexColor('333739'),
  unselectedWidgetColor: Colors.white,
  //عشان أغير لون ال scaffold في الكل
  // first thing
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    // فيها حاجات تنطبق على ال app bar اللي في ال app كله
    backgroundColor: HexColor('454545'),
    actionsIconTheme: const IconThemeData(color: Colors.white,),
    elevation: 0.0,

    // عاوز بقا أغير ال status bar
    // backwardsCompatibility: false,
    // titleTextStyle: TextStyle(
    //   fontFamily: 'Jannah',
    //
    //   fontSize: 20.0,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.white,
    // ),
    // عشان أعدل في لون الحاجات اللي في ال action جوه ال app bar
    iconTheme: const IconThemeData(
      color: Colors.pink,
    ),
    // عملته false عشان اعرف اتحكم في ال status bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    //عاوز أغير في لون ال Button nav bar
    selectedItemColor: Colors.pink,
    unselectedItemColor: Colors.white,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor:HexColor('333739') ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'RobotoCondensed',

      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.pinkAccent,
      fontFamily: 'RobotoCondensed',

      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    caption: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'RobotoCondensed',

      color: Colors.white,
      height: 1.3,
    ),
    subtitle1: TextStyle(
      fontFamily: 'RobotoCondensed',

      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1,
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: HexColor('333739'),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: HexColor('454545'),
    border: InputBorder.none,
    suffixIconColor: Colors.white,
    hintStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),

  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: HexColor('454545'),
  ),
);