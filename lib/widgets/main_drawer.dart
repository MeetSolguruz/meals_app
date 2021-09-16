import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

// jo aapde (iconData icon) use karie to dynamically data lai shakie 6ia ex..
// exx.... buildListTile('Meals' ne title lidhu , Icons.restaurant ne icon tarike)
// Icon(Icons.settings) see down if don't use this method...we have to write like this instead...
// also we can call void-callback instead of function..

class MainDrawer extends StatelessWidget {
  Widget builderListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
      onTap: () => {
        tapHandler(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          builderListTile(
            'Meals',
            Icons.restaurant,
            () {
              // Navigator.of(context).pushNamed('/');
              Navigator.of(context).pushNamed('/');
            },
          ),
          builderListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

// we can either use this kind of steps if we don't use builder..
// After sized box we have to use this for two different items..
//           ListTile(
//             leading: Icon(
//               Icons.settings,
//               size: 26,
//             ),
//             title: Text(
//               'Filters',
//               style: TextStyle(
//                 fontFamily: 'RobotoCondensed',
//                 fontSize: 24,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             onTap: () {},
//           ),
