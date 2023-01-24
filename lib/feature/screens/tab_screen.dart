import 'package:akht2r/feature/screens/categories.dart';
import 'package:akht2r/feature/screens/favourites_screen.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  List<Map<String,Object>>? pages ;
  void changeIndex(int newIndex) {
    setState(() {
      currentIndex=newIndex;
    });
  }
@override
  void initState() {
  pages=[{
    'page': const CategoriesScreen(),
    'title': 'Categories',
  },{
    'page':  FavoritesScreen(),
    'title': 'Favorites',
  }];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:  MainDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Theme.of(context).iconTheme.color,
        ),
        title: Text(pages![currentIndex]['title'] as String),
      ),
      body: pages![currentIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(
            icon: IconButton(onPressed: (){}, icon: const Icon(Icons.category)),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
            label: 'favorites',
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        onTap: changeIndex,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

}
