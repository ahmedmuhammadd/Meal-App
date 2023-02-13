import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const RouteName = "category_meal";
  final List<Meal> _availableMeals;

  const CategoryMealScreen(this._availableMeals);

  @override
  CategoryMealScreenState createState() => CategoryMealScreenState();
}

class CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeCat =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final cateId = routeCat['id'];
    final cateTitle = routeCat['title'];
    final catMeal = widget._availableMeals.where((meal) {
      return meal.categories.contains(cateId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(cateTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: catMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: catMeal[index].id,
            duration: catMeal[index].duration,
            title: catMeal[index].title,
            url: catMeal[index].imageUrl,
            complexity: catMeal[index].complexity,
            affordability: catMeal[index].affordability,
          );
        },
      ),
    );
  }
}
