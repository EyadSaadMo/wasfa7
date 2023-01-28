import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../core/provider/language_provider.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/themes';
  final bool fromOnBoarding;

  const ThemeScreen({this.fromOnBoarding = false, Key? key}) : super(key: key);

  Widget buildRadioListTile(ThemeMode themeValue, String text, IconData icon,
      BuildContext context) {
    return RadioListTile(
      title: Text(text),
      secondary: Icon(icon),
      value: themeValue,
      groupValue: Provider
          .of<ThemeProvider>(context, listen: true)
          .tm,
      onChanged: (newThemeValue) =>
          Provider.of<ThemeProvider>(context, listen: false)
              .themeModeChange(newThemeValue),
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
                 backgroundColor:fromOnBoarding?Theme.of(context).canvasColor:Theme.of(context).primaryColor,
                 elevation: fromOnBoarding?0:5,
                 title: fromOnBoarding ?null:Text(lan.getTexts('theme_appBar_title'), style: Theme
                     .of(context)
                     .textTheme
                     .headline6,),
               ),
               SliverList(delegate: SliverChildListDelegate([
                 Container(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(lan.getTexts('theme_screen_title'), style: Theme
                       .of(context)
                       .textTheme
                       .headline6,),
                 ),
                         Container(
                           padding: const EdgeInsets.all(20.0),
                           child: Text(
                             lan.getTexts('theme_mode_title'), style: Theme
                               .of(context)
                               .textTheme
                               .headline6,),
                         ),
                         buildRadioListTile(ThemeMode.system,
                             lan.getTexts('System_default_theme'),
                             Icons.system_security_update, context),
                         buildRadioListTile(
                             ThemeMode.light, lan.getTexts('light_theme'),
                             Icons.wb_sunny_outlined, context),
                         buildRadioListTile(
                             ThemeMode.dark, lan.getTexts('dark_theme'),
                             Icons.nights_stay_outlined, context),
                         buildListTile(context, lan.getTexts('primary'),),
                         buildListTile(context, lan.getTexts('accent'),),
                         SizedBox(height: fromOnBoarding?80:0,),
                       ],
                     ),),
             ],

          ),
        ));
  }

  ListTile buildListTile(BuildContext context, txt) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    var primaryColor =
        Provider
            .of<ThemeProvider>(context, listen: true)
            .primaryColor;
    var accentColor =
        Provider
            .of<ThemeProvider>(context, listen: true)
            .accentColor;
    return ListTile(
      title: Text(
          txt
      ),
      trailing: CircleAvatar(
        backgroundColor: txt == lan.getTexts('primary')
            ? primaryColor
            : accentColor,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                elevation: 4.0,
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: txt == lan.getTexts('primary')
                        ? Provider
                        .of<ThemeProvider>(context, listen: true)
                        .primaryColor
                        : Provider
                        .of<ThemeProvider>(context, listen: true)
                        .accentColor,
                    onColorChanged: (newColor) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .onChanged(
                            newColor, txt == lan.getTexts('primary') ? 1 : 2),
                    colorPickerWidth: 300.0,
                    pickerAreaHeightPercent: 0.7,
                    displayThumbColor: true,
                    showLabel: false,
                  ),
                ),
              ),
        );
      },
    );
  }
}
