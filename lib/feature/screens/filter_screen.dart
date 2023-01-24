import 'package:akht2r/core/provider/app_provider.dart';
import 'package:akht2r/feature/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
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
      title: Text(title,style: Theme.of(context).textTheme.bodyText2,),
      value: currentValue,
      subtitle: Text(
        description,style: Theme.of(context).textTheme.bodyText1,
      ),
      onChanged: updateValue,
    );
  }
  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters = Provider.of<AppProvider>(context,listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'your filters',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals.',
                currentFilters['gluten']!,
                    (newValue) {
                  setState(
                        () {
                          currentFilters['gluten']= newValue;
                    },
                  );
                  Provider.of<AppProvider>(context,listen: false).setFilters();
                },
              ),
              buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals.',
                currentFilters['lactose']!,
                    (newValue) {
                  setState(
                        () {
                          currentFilters['lactose'] = newValue;
                    },
                  );
                  Provider.of<AppProvider>(context,listen: false).setFilters();

                    },
              ),
              buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals.',
                currentFilters['vegetarian']!,
                    (newValue) {
                  setState(
                        () {
                          currentFilters['vegetarian']= newValue;
                    },
                  );
                  Provider.of<AppProvider>(context,listen: false).setFilters();

                    },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only include vegan meals.',
                currentFilters['vegan']!,
                    (newValue) {
                  setState(
                        () {
                          currentFilters['vegan']= newValue;
                    },
                  );
                  Provider.of<AppProvider>(context,listen: false).setFilters();

                    },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
