import 'file:///D:/Projects/Flutter/MealsApp/lib/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) =>
        element.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}