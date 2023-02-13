import 'package:flutter/material.dart';
import 'package:meal_app/widgets/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget BuidListTile(IconData icon, String text, Function function) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Text(
              "Cooking Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
            height: 130,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          BuidListTile(Icons.restaurant, "meal", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuidListTile(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.RouteName);
          }),
        ],
      ),
    ));
  }
}
