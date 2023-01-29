import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/feature/screens/categories.dart';
import 'package:akht2r/feature/screens/favourites_screen.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';
import '../../core/provider/language_provider.dart';


class TabsScreen extends StatefulWidget {
  static const routeName = 'tabs_screen';
  const TabsScreen({super.key});


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int currentIndex = 0;
  List<Map<String,Object>>? pages ;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<MealProvider>(context,listen: false).getData();
      Provider.of<ThemeProvider>(context,listen: false).getThemeMode();
      // Provider.of<ThemeProvider>(context,listen: false).getThemeColors();
      Provider.of<LanguageProvider>(context,listen: false).getLan();
      super.initState();
    });
  }

  void changeIndex(int newIndex) {
    setState(() {
      currentIndex=newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: false);
    pages=[{
      'page': const CategoriesScreen(),
      'title': lan.getTexts('categories'),
    },{
      'page':  const FavoritesScreen(),
      'title': lan.getTexts('your_favorites'),
    }];
    return Directionality(
        textDirection:  lan.isEn?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
      drawer:  const MainDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
         title: Text(pages![currentIndex]['title'] as String,style: Theme.of(context).textTheme.bodyText1,),
      ),
      body: pages![currentIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label:lan.getTexts('categories'),
          ),
          BottomNavigationBarItem(
            icon:const Icon(Icons.favorite_border_outlined),
            label:lan.getTexts('your_favorites'),

          ),
        ],
        onTap: changeIndex,
        currentIndex: currentIndex,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      ),
    ));
  }
}
