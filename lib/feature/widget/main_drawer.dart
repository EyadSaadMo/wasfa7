import 'package:akht2r/core/provider/language_provider.dart';
import 'package:akht2r/core/provider/theme_provider.dart';
import 'package:akht2r/feature/screens/tab_screen.dart';
import 'package:akht2r/feature/screens/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var lan = Provider.of<LanguageProvider>(context,listen: true);
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment:lan.isEn ? Alignment.centerLeft:Alignment.centerRight,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Text(
              lan.getTexts('drawer_name'),
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
            child: buildListTile(lan.getTexts('drawer_item1'), Icons.restaurant,context),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            child: buildListTile(lan.getTexts('drawer_item2'), Icons.settings,context),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pushReplacementNamed(ThemeScreen.routeName);
            },
            child: buildListTile(lan.getTexts('drawer_item3'), Icons.color_lens_outlined,context),
          ),
          Divider(height: 1.0,color: Colors.black,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 20,right: 22),
            child: Text(lan.getTexts('drawer_switch_title'),style: Theme.of(context).textTheme.headline6,),
          ),
          Padding(
            padding:  EdgeInsets.only(right: (lan.isEn? 0 :20),left: (lan.isEn? 20:0),bottom: (lan.isEn? 20:0),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(lan.getTexts('drawer_switch_item2'),style: Theme.of(context).textTheme.headline6,),
                Switch(value: Provider.of<LanguageProvider>(context,listen: true).isEn,
                    onChanged: (newValue){
                      Provider.of<LanguageProvider>(context,listen: false).changeLan(newValue);
                      Navigator.pop(context);
                    },
                  inactiveThumbColor: Provider.of<ThemeProvider>(context,listen: true).tm == ThemeMode.light?null:Colors.black,
                ),
                Text(lan.getTexts('drawer_switch_item1'),style: Theme.of(context).textTheme.headline6,),
              ],
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
