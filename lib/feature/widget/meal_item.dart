import 'package:akht2r/core/provider/language_provider.dart';
import 'package:akht2r/feature/screens/meal_detils_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import 'package:provider/provider.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  const MealItem(
      {Key? key,
      required this.imageUrl,
      required this.id,
      required this.duration,
      required this.complexity,
      required this.affordability,
        // required this.removeItem,
      })
      : super(key: key);
  //
  // String get complexityText {
  //   switch (complexity) {
  //     case Complexity.Simple:
  //       return 'simple';
  //     case Complexity.Challenging:
  //       return 'challenging';
  //     case Complexity.Hard:
  //       return 'hard';
  //     default:
  //       return 'unKnown';
  //   }
  // }
  // String get affordabilityText{
  //   switch(affordability){
  //
  //     case Affordability.Affordable:
  //       return 'affordable';
  //     case Affordability.Pricey:
  //       return 'pricey';
  //     case Affordability.Luxurious:
  //       return 'luxurious';
  //     default:
  //       return 'unKnown';
  //   }
  // }
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName,arguments: id).then((value) {
    });
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context,listen: true);
    return InkWell(
       onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(52),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child:Hero(
                    tag: id,
                    child: InteractiveViewer(
                      child: FadeInImage(
                        width: double.infinity,
                        placeholder: const AssetImage('assets/images/a2.png'),
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) ,
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                     lan.getTexts('meal-$id'),
                      style: TextStyle(color: Colors.white,fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                       Icon(
                        Icons.schedule,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      if(duration <= 10)
                      Text('$duration '+ lan.getTexts('min2'),),
                      if(duration > 10)
                      Text("$duration "+ lan.getTexts('min'),),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                       Icon(
                        Icons.work,
                         color: Colors.black,

                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(lan.getTexts('$complexity'),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                       Icon(
                        Icons.attach_money,
                         color: Colors.black,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(lan.getTexts('$affordability'),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
