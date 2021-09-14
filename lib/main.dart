import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main(List<String> args) {
  runApp(MealsApp());
}

//hello
class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(255, 254, 245, 1),
        //canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                //Main Title Color of category item
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                //Inside the category item name color
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(), we can use this here down as follow
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
