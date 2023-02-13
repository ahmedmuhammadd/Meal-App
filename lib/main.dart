import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'package:meal_app/widgets/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _mealFavorite = [];
  bool chek;

  void _toggleFavorite(String id) {
    final existingIndex = _mealFavorite.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0)
      _mealFavorite.removeAt(existingIndex);
    else
      _mealFavorite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
  }

  bool _isFavorite(String mealsId) {
    return _mealFavorite.any((meal) => meal.id == mealsId);
  }

  void _setFilters(Map<String, bool> _filtered) {
    setState(() {
      _filters = _filtered;
      _availableMeals = DUMMY_MEALS.where((value) {
        if (_filters['gluten'] & !value.isGlutenFree) return false;
        if (_filters['lactose'] & !value.isLactoseFree) return false;
        if (_filters['vegan'] & !value.isVegan) return false;
        if (_filters['vegetarian'] & !value.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              subtitle1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(_mealFavorite),
        CategoryMealScreen.RouteName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetails.RouteName: (context) =>
            MealDetails(_toggleFavorite, _isFavorite),
        FilterScreen.RouteName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
    );
  }
}
