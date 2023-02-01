import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:news/shared/styles/my_theme.dart';

import '../../models/search/SearchResponse.dart';

class itemsearch extends StatelessWidget {
  String base ='https://image.tmdb.org/t/p/w500';
  Results results;
  itemsearch({required this.results});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.15,
            width: MediaQuery.of(context).size.width*.25,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network('https://image.tmdb.org/t/p/w500${results.posterPath??''}',
              fit: BoxFit.fill,),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*.01,
          ),
          Container(
            decoration:BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(12),
            ),
            height: MediaQuery.of(context).size.height*.20,
            width: MediaQuery.of(context).size.width*.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(results.originalTitle??'',
                  style:TextStyle(fontSize: 20,
                      color:Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height*.001,
                ),
                Text(results.releaseDate??'',
                  style:TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text('Language : ${results.originalLanguage??''}',
                  style:TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
