import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/language_provider.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/themes';
  final bool fromOnBoarding;

  const ThemeScreen({this.fromOnBoarding = false, Key? key}) : super(key: key);

  Widget buildRadioListTile(ThemeMode themeValue, String text, IconData icon,
      BuildContext context) {
    return RadioListTile(
      title: Text(text,style: Theme.of(context).textTheme.bodyText2,),
      secondary: Icon(icon,color: Theme.of(context).primaryIconTheme.color),
      value: themeValue,
      groupValue: Provider
          .of<ThemeProvider>(context, listen: true)
          .tm,
      onChanged: (newThemeValue) =>
          Provider.of<ThemeProvider>(context, listen: false)
              .themeModeChange(newThemeValue),
      activeColor: Theme.of(context).textTheme.bodyText2!.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
        textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          drawer: fromOnBoarding?null: const MainDrawer(),
          body: CustomScrollView(
             slivers: [
               SliverAppBar(
                 pinned: false,
                 elevation: fromOnBoarding?0:5,
                 iconTheme: IconThemeData(
                   color: Theme.of(context).iconTheme.color
                 ),
                 title: fromOnBoarding ?null:Text(lan.getTexts('theme_appBar_title'), style: Theme
                     .of(context)
                     .textTheme
                     .bodyText1,),
                 backgroundColor: fromOnBoarding?Theme.of(context).canvasColor:Theme.of(context).appBarTheme.backgroundColor,
               ),
               SliverList(delegate: SliverChildListDelegate([
                 Container(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(lan.getTexts('theme_screen_title'), style: Theme
                       .of(context)
                       .textTheme
                       .bodyText2,),
                 ),
                 Container(
                           padding: const EdgeInsets.all(20.0),
                           child: Text(
                             lan.getTexts('theme_mode_title'), style: Theme
                               .of(context)
                               .textTheme
                               .bodyText2,),
                         ),
                         buildRadioListTile(
                             ThemeMode.light, lan.getTexts('light_theme'),
                             Icons.wb_sunny_outlined, context),
                         buildRadioListTile(
                             ThemeMode.dark, lan.getTexts('dark_theme'),
                             Icons.nights_stay_outlined, context),
                         SizedBox(height: fromOnBoarding?80:0,),
                       ],
                     ),),
             ],

          ),
        ));
  }

}
