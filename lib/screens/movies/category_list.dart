import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/movies/categorysearch.dart';

import '../../models/Movies/categorymovies.dart';
import '../../models/Movies/searchcatedory.dart';
import '../../models/search/SearchResponse.dart';
import '../../shared/network/remote/search/api_manger.dart';
import '../../shared/network/remote/movies/api_manger_movies.dart';
import '../search/item_search.dart';

class categorylist extends StatelessWidget {
  static const String routeName='categorylist';
  @override
  Widget build(BuildContext context) {
    var select =ModalRoute.of(context)?.settings.arguments as num;
    print(select);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.03,
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  select=='';
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.25,
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
                            Center(child: Text('Errrrrrror',style: TextStyle(color: Colors.white),)),
                          ],
                        );
                      }
                      if(snapshot.data?.status_code==7){
                        return Center(
                            child:
                            Text(snapshot.data?.status_message??'Invalid API key',style: TextStyle(color: Colors.white)));
                      }
                      String? selectgenres;
                      int index=0;
                      while(snapshot.data?.genres?[index].id != select){
                        index++;
                      }
                      selectgenres =snapshot.data?.genres?[index].name;
                      return Text(selectgenres??'',
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold,color: Colors.white),);

                    }),
              ],
            ),
            FutureBuilder<Searchcatedory>(
                future: Apimangerseachmovies.getsources(context),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Column(
                      children: [
                        Center(child: Text('No Search ',style: TextStyle(color: Colors.white))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.01,
                        ),
                        Center(child: Text('query must be provided',style: TextStyle(color: Colors.white))),
                      ],
                    );
                  }
                  if(snapshot.data?.status_code==7){
                    return Center(
                        child:
                        Text(snapshot.data?.status_message??'Invalid API key',style: TextStyle(color: Colors.white)));
                  }
                  var movieslist =[];
                  int? size3 =snapshot.data?.results?.length??0;
                  for(int i=0;i < size3;i++){
                    int size2 =snapshot.data?.results?[i].genreIds?.length??0;
                    for(int j=0;j<size2;j++){
                      if(snapshot.data?.results?[i].genreIds?[j]==select){
                        movieslist.add(snapshot.data?.results?[j]);
                      }
                    }
                  };
                  print(movieslist);
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        return categorysearch(results : movieslist[index]);
                      },
                      itemCount: movieslist.length,
                    ),
                  );

                }),
          ],
        ),
      ),
    );
  }
}






