import 'package:flutter/material.dart';

import '/models/meal.dart';
import '../widgets/main_drawer.dart';

import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourite'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          // stops: [0.0, 0.8],
          //tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        onTap: _selectPage,
        // check till down....
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        // unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        currentIndex: _selectedPageIndex,
        //current-index is used for j select karie e highlight thaay...
        // type: BottomNavigationBarType.shifting,
        // we can use this when we want to shift the name to icon when we go on another page..
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            // unlock this when you unlock @type shifting.
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            // unlock this when you unlock @type shifting.
            icon: Icon(Icons.star),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title'] as String),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blueAccent],
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }
}



        // Hello Here,(check till down is here...)
        // Also we can use this.
        // backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: Colors.blueAccent,
        // selectedItemColor: Theme.of(context).canvasColor,
        //selectedItemColor: Colors.red,
        // unselectedItemColor: Theme.of(context).canvasColor, 