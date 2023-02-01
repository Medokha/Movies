import 'package:flutter/material.dart';
import 'package:news/provider/provider_search.dart';
import 'package:news/provider/provider_settings.dart';
import 'package:news/screens/movies/category_list.dart';
import 'package:news/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';
import 'layout/Home.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context)=>providersettings()),
      ChangeNotifierProvider(create:
          (context)=>providersearch()),
    ],

    child:  MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providersettings>(context);
    return MaterialApp(
      initialRoute: Homelayout.routeName,
      routes: {
        Homelayout.routeName:(context)=>Homelayout(),
        categorylist.routeName:(c)=>categorylist(),
      },
      debugShowCheckedModeBanner: false,
      theme:my_theme.lightmode ,
      darkTheme: my_theme.darktmode,
      themeMode: pro.dropdownvalue2,

    );
  }
}
