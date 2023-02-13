import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Categories"),
      //   centerTitle: true,
      // ),
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(e.id, e.title, e.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
