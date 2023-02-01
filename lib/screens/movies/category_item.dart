import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/movies/category_list.dart';

import '../../models/Movies/categorymovies.dart';

class categoryitem extends StatelessWidget {
  Genres Category  ;
  categoryitem( this.Category);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, categorylist.routeName,
        arguments:Category.id??0 );
      },
      child: Container(
        child: Stack(
          children: [
            Image.asset('assets/images/action.jfif',fit: BoxFit.fill,),
            Container(
              alignment:Alignment.topCenter,
              child: Text(Category.name??'',
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
