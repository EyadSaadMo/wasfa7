import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).textTheme.bodyText2!.color,
        size: 26,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).textTheme.bodyText1!.color),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: buildListTile('Meals', Icons.restaurant,context),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            child: buildListTile('Filters', Icons.settings,context),
          ),
        ],
      ),
    );
  }
}
