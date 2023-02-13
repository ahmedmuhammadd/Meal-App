import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const RouteName = "Meal_details";
  final Function _toggleFavorite;
  final Function _isFavorite;

  const MealDetails(this._toggleFavorite, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    Widget buildTitle(context, String title) {
      return Container(
        margin: EdgeInsets.all(5),
        child: Text(
          title,
          // style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget ingreditem(Widget child) {
      return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          width: 300,
          child: child);
    }

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final ImgOnTaped = DUMMY_MEALS.firstWhere((value) => value.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${ImgOnTaped.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Image.network(
                ImgOnTaped.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "Ingredients"),
            ingreditem(
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(3),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(ImgOnTaped.ingredients[index]),
                    ),
                  );
                },
                itemCount: ImgOnTaped.ingredients.length,
              ),
            ),
            buildTitle(context, "Steps"),
            ingreditem(
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(ImgOnTaped.steps[index]),
                        leading: CircleAvatar(
                          child: Text("#${index + 1}"),
                        ),
                      ),
                      Divider(
                        color: Colors.black54,
                      ),
                    ],
                  );
                },
                itemCount: ImgOnTaped.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleFavorite(mealId);
        },
        child: Icon(
          _isFavorite(mealId) ? Icons.favorite : Icons.favorite_border_outlined,
        ),
      ),
    );
  }
}
