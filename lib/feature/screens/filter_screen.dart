import 'package:akht2r/core/provider/app_provider.dart';
import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/language_provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final bool fromOnBoarding;

  const FiltersScreen({this.fromOnBoarding = false, super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      value: currentValue,
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onChanged: updateValue,
      inactiveThumbColor:
          Provider.of<ThemeProvider>(context, listen: true).tm ==
                  ThemeMode.light
              ? null
              : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: true).filters;
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
        textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          drawer: widget.fromOnBoarding?null: const MainDrawer(),
          body:CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                backgroundColor: widget.fromOnBoarding?Theme.of(context).canvasColor:Theme.of(context).primaryColor,
                title: widget.fromOnBoarding?null:Text(
                  lan.getTexts('filters_appBar_title'),
                  style: Theme.of(context).textTheme.headline6,
                ),
                elevation: widget.fromOnBoarding?0:5,
              ),
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    lan.getTexts('filters_screen_title'),
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                      buildSwitchListTile(
                        lan.getTexts('Gluten-free'),
                        lan.getTexts('Gluten-free-sub'),
                        currentFilters['gluten']!,
                            (newValue) {
                          setState(
                                () {
                              currentFilters['gluten'] = newValue;
                            },
                          );
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        },
                      ),
                      buildSwitchListTile(
                        lan.getTexts('Lactose-free'),
                        lan.getTexts('Lactose-free_sub'),
                        currentFilters['lactose']!,
                            (newValue) {
                          setState(
                                () {
                              currentFilters['lactose'] = newValue;
                            },
                          );
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        },
                      ),
                      buildSwitchListTile(
                        lan.getTexts('Vegetarian'),
                        lan.getTexts('Vegetarian-sub'),
                        currentFilters['vegetarian']!,
                            (newValue) {
                          setState(
                                () {
                              currentFilters['vegetarian'] = newValue;
                            },
                          );
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        },
                      ),
                      buildSwitchListTile(
                        lan.getTexts('Vegan'),
                        lan.getTexts('Vegan-sub'),
                        currentFilters['vegan']!,
                            (newValue) {
                          setState(
                                () {
                              currentFilters['vegan'] = newValue;
                            },
                          );
                          Provider.of<MealProvider>(context, listen: false)
                              .setFilters();
                        },
                      )
                    ],
                  ),
                ),
              ]),),

        );
  }
}
