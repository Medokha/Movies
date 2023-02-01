import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 3505a228d57ab4b13ce646bc6291ff0a
import '../screens/Home.dart';
import '../screens/movies/Movies.dart';
import '../screens/search/Search.dart';
import '../screens/Setting/settings.dart';
import '../screens/Watchlater.dart';
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
      // appBar: AppBar(title: Text('Movies'),),
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
            AssetImage('assets/images/Home icon.png'),size: 25,
          ),label: 'Home',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/search-2.png'),size: 25,
          ),label: 'Search',),
          // BottomNavigationBarItem(icon: IconButton(onPressed: () {
          //   showSearch(context: context, delegate:moviessearch() );
          // },
          //   icon: ImageIcon(
          //     AssetImage('assets/images/Search.png'),size: 60,
          //   ),),label: '',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/movie.png'),size: 25,
          ),label: 'Movie',),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage('assets/images/watch.png'),size: 25,
          ),label: 'Watch List',),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 25,),
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