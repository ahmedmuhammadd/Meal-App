import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _mealFavorite;

  FavoriteScreen(this._mealFavorite);

  @override
  Widget build(BuildContext context) {
    if (_mealFavorite.isEmpty)
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: (Text(
            "YOU HAVE NO FAVORITES YET - START ADDING SOME!",
            // style: Theme.of(context).textTheme.title,
          )),
        ),
      );
    else
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _mealFavorite.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _mealFavorite[index].id,
            duration: _mealFavorite[index].duration,
            title: _mealFavorite[index].title,
            url: _mealFavorite[index].imageUrl,
            complexity: _mealFavorite[index].complexity,
            affordability: _mealFavorite[index].affordability,
          );
        },
      );
  }
}
