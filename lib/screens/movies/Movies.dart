import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Movies/categorymovies.dart';
import '../../shared/network/remote/movies/api_manger_movies.dart';
import 'category_item.dart';

class Movies extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.05,
          ),
          Text('Browse Category',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
          SizedBox(
            height: MediaQuery.of(context).size.height*.01,
          ),
          FutureBuilder<Categorymovies>(
            future: Apimangermovies.getsources(context),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Column(
                  children: [
                    Center(child: Text('Errrrrrror')),
                  ],
                );
              }
              if(snapshot.data?.status_code==7){
                return Center(
                    child:
                    Text(snapshot.data?.status_message??'Invalid API key'));
              }
              var categorylist =snapshot.data?.genres??[];
              return
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          mainAxisExtent: MediaQuery.of(context).size.height*.2,
                          crossAxisSpacing: 30,
                        ),
                        itemBuilder: (context,index){
                          return
                            categoryitem(categorylist[index]);
                        },itemCount: categorylist.length,
                    ),
                  );
            }),
        ],
      );
  }
}
