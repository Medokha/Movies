import 'package:flutter/material.dart';
import 'package:news/shared/styles/my_theme.dart';

import 'layout/Home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homelayout.routeName,
      routes: {
        Homelayout.routeName:(context)=>Homelayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: my_theme.lightmode,
      darkTheme: my_theme.darktmode,

    );
  }
}
