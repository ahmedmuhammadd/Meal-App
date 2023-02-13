import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourit_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _mealFavorite;

  TabScreen(this._mealFavorite);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  List<Map<String, Object>> Pages;
  @override
  void initState() {
    Pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(widget._mealFavorite),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Pages[selectedIndex]['title'],
        ),
      ),
      body: Pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _selectedPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _selectedPage(int value) {
    setState(() {
      selectedIndex = value;
    });
  }
}
