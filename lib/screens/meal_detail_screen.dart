import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 300,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            // Container(
            //   child: Text(
            //     'Ingredients',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            //
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  //color: Theme.of(context).accentColor,
                  // elevation: 5,
                  color: Colors.white30,

                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
