import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const RouteName = "Filter_meal";
  final Function _setFilters;
  final Map<String, bool> _filters;

  const FilterScreen(this._filters, this._setFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget._filters['gluten'];
    isLactoseFree = widget._filters['lactose'];
    isVegan = widget._filters['vegan'];
    isVegetarian = widget._filters['vegetarian'];
    super.initState();
  }

  Widget BuildSwitchList({
    bool value,
    Function onChanged,
    String title,
    String subtitle,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
              };
              widget._setFilters(_filters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "ADJUST YOUR MEAL SELECTION ",
                // style: Theme.of(context).textTheme.title,
              ),
            )),
          ),
          BuildSwitchList(
            value: isGlutenFree,
            onChanged: (value) {
              setState(() {
                isGlutenFree = value;
              });
            },
            title: "GlutenFree",
            subtitle: "only include Gluten-Free meals",
          ),
          BuildSwitchList(
            value: isLactoseFree,
            onChanged: (value) {
              setState(() {
                isLactoseFree = value;
              });
            },
            title: "LactoseFree",
            subtitle: "only include Lactose-Free meals",
          ),
          BuildSwitchList(
            value: isVegan,
            onChanged: (value) {
              setState(() {
                isVegan = value;
              });
            },
            title: "Vegan",
            subtitle: "only include Vegan meals",
          ),
          BuildSwitchList(
            value: isVegetarian,
            onChanged: (value) {
              setState(() {
                isVegetarian = value;
              });
            },
            title: "Vegetarian",
            subtitle: "only include Vegetarian meals",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
