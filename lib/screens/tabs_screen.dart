import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Your Favourite'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).canvasColor,
        // unselectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectedPageIndex,
        //current-index is used for j select karie e highlight thaay...
        // type: BottomNavigationBarType.shifting,
        // we can use this when we want to shift the name to icon when we go on another page..
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            // unlock this when you unlock @type
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            // unlock this when you unlock @type
            icon: Icon(Icons.star),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
