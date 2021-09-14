import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Meals',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map(
              (calData) => CategoryItem(
                calData.id,
                calData.title,
                calData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //mainAxisExtent: 150,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
