import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Home.dart';
import '../screens/Movies.dart';
import '../screens/Search.dart';
import '../screens/Watchlater.dart';
import '../screens/setting.dart';


class Homelayout extends StatefulWidget {
  static const String routeName='home';

  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  int currentindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies'),),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index){
          currentindex = index;
          setState(() {
          });
        },
        items: [
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/Home icon.png'),size: 30,
          ),label: 'Home',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/search-2.png'),size: 30,
          ),label: 'Search',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/movie.png'),size: 30,
          ),label: 'Movie',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/watch.png'),size: 30,
          ),label: 'Watch List',),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,),
              label: 'Setting',)

        ],
      ),
      body: tabs[currentindex],
    );
  }
}
List<Widget> tabs=[
  Home(),
  Search(),
  Movies(),
  Watchlater(),
  setting()
];