import 'package:akht2r/feature/screens/tab_screen.dart';
import 'package:akht2r/feature/screens/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../core/provider/language_provider.dart';
import '../../core/provider/theme_provider.dart';
import 'filter_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      color:Theme.of(context).appBarTheme.backgroundColor,
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        lan.getTexts("drawer_name"),
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Container(
                      width: 350,
                      color:Theme.of(context).appBarTheme.backgroundColor,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            lan.getTexts('drawer_switch_title'),
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(lan.getTexts('drawer_switch_item2'),
                                  style: Theme.of(context).textTheme.bodyText1),
                              Switch(
                                value: lan.isEn,
                                onChanged: (newValue) {
                                  Provider.of<LanguageProvider>(context,
                                      listen: false)
                                      .changeLan(newValue);
                                },
                                // activeTrackColor: Theme.of(context).textTheme.bodyText1!.color,
                                // activeColor: Theme.of(context).appBarTheme.backgroundColor,
                                // inactiveThumbColor: Theme.of(context).appBarTheme.backgroundColor,
                                activeTrackColor:
                                Provider.of<ThemeProvider>(context, listen: true).tm ==
                                    ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                                inactiveTrackColor:
                                Provider.of<ThemeProvider>(context, listen: true).tm ==
                                    ThemeMode.light
                                    ? Colors.white
                                    : Colors.black,
                                activeColor:
                                Provider.of<ThemeProvider>(context, listen: true).tm ==
                                    ThemeMode.light
                                    ?Theme.of(context).textTheme.bodyText2!.color
                                    : Colors.white,
                                inactiveThumbColor:
                                Provider.of<ThemeProvider>(context, listen: true).tm ==
                                    ThemeMode.light
                                    ?Theme.of(context).textTheme.bodyText2!.color
                                    : Colors.white,
                              ),
                              Text(lan.getTexts('drawer_switch_item1'),
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ThemeScreen(fromOnBoarding: true),
              const FiltersScreen(fromOnBoarding: true),
            ],
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
          ),
          Indicator(currentIndex),
          Builder(
            builder: (ctx) => Align(
              alignment: const Alignment(0, 0.85),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  padding: lan.isEn ? const EdgeInsets.all(7) : const EdgeInsets.all(0),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(lan.getTexts('start'),
                      style: Theme.of(context).textTheme.bodyText1),
                  onPressed: () async {
                    Navigator.of(ctx)
                        .pushReplacementNamed(TabsScreen.routeName);

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('watched', true);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;

  const Indicator(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context, 0),
          buildContainer(context, 1),
          buildContainer(context, 2),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext ctx, int i) {
    return index == i
        ? Icon(Icons.star, color: Theme.of(ctx).primaryColor)
        : Container(
      margin: const EdgeInsets.all(4),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: Theme.of(ctx).appBarTheme.backgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
