import 'package:flutter/material.dart';

import '/models/meal.dart';
import '/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favrouriteMeals;

  FavouritesScreen(this.favrouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favrouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favourite yet: start adding some!',
          style: TextStyle(fontSize: 22),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favrouriteMeals[index].id,
            title: favrouriteMeals[index].title,
            imageUrl: favrouriteMeals[index].imageUrl,
            duration: favrouriteMeals[index].duration,
            complexity: favrouriteMeals[index].complexity,
            affordability: favrouriteMeals[index].affordability,
          );
        },
        itemCount: favrouriteMeals.length,
      );
    }
  }
}
