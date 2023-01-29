import 'package:akht2r/feature/models/dummy_data_model.dart';
import 'package:flutter/material.dart';
import '../../core/provider/app_provider.dart';
import '../../core/provider/language_provider.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text, style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: isLandScape ? deviceHeight * 0.5 : deviceHeight * 0.25,
      width: isLandScape ? (deviceWidth * 0.5 - 30) : deviceWidth,
      child: child,
    );
  }

  String? mealId;

  @override
  void didChangeDependencies() {
    mealId = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    List<String> liIngredientList =
    lan.getTexts('steps-$mealId') as List<String>;
    var liSteps = ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (ctx, index) =>
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
            ),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text('${(index + 1)}'),
                  ),
                  title: Text(
                    liIngredientList[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
          ),
      itemCount: liIngredientList.length,
    );
    List<String> listStepsList =
    lan.getTexts('ingredients-$mealId') as List<String>;
    var liIng = ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (ctx, index) {
        return Card(
            color: Theme.of(context).cardTheme.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                listStepsList[index],
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
            ));
      },
      itemCount: listStepsList.length,
    );
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Provider.of<MealProvider>(context, listen: true)
                .isMealFavorite(mealId!)
                ? Icons.star
                : Icons.star_border,
          ),
          onPressed: () {
            Provider.of<MealProvider>(context, listen: false)
                .toggleFavorite(mealId!);
          },
        ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(lan.getTexts('meal-$mealId'),style: Theme.of(context).textTheme.bodyText1,),
              background:Hero(
                tag: mealId!,
                child: InteractiveViewer(
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/a2.png'),
                    image: NetworkImage(
                      selectedMeal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ) ,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      buildSectionTitle(
                          context, lan.getTexts('Ingredients')),
                      buildContainer(liIng),
                    ],
                  ),
                  Column(
                    children: [
                      buildSectionTitle(context, lan.getTexts('Steps')),
                      buildContainer(liSteps),
                    ],
                  ),
                ],
              ),
            if (!isLandScape)
              buildSectionTitle(context, lan.getTexts('Ingredients')),
            if (!isLandScape) buildContainer(liIng),
            if (!isLandScape)
              buildSectionTitle(context, lan.getTexts('Steps')),
            if (!isLandScape) buildContainer(liSteps),
          ],),),
        ],
      )
      )    );
  }
}
