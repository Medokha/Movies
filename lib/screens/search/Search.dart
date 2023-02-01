import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/provider_search.dart';
import 'package:news/screens/search/item_search.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:provider/provider.dart';
import '../../models/search/SearchResponse.dart';
import '../../shared/network/remote/search/api_manger.dart';

class Search extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  String? q;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providersearch>(context);
    return
      Column(
      children:[
        SizedBox(
          height: MediaQuery.of(context).size.height*.05,
        ),
        TextField(
        controller:textFieldController,
          autofocus: true,

        keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 22.0, color:Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: grey,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          hintText: 'Enter Item Search ',
          hintStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color: Colors.white),
          icon: IconButton(onPressed: (){
            pro.changesearch(textFieldController.text);
          }, icon:Icon(Icons.search,size: 40,color: Colors.white,),),
        ),
      ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.02,
        ),
        FutureBuilder<Searchresponse>(
            future: Apimanger.getsources(context,textFieldController.text),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              var movieserror =snapshot.data?.errors;
              if(snapshot.hasError){
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.2,
                    ),
                    Center(child: Text('No Movies ',
                      style: TextStyle(color: Colors.white,fontSize: 30),)),
                  ],
                );
              }
              if(snapshot.data?.status_code==7){
                return Center(
                    child:
                    Text(snapshot.data?.status_message??'Invalid API key'));
              }
              var movieslist =snapshot.data?.results??[];
              return Expanded(
                child: ListView.builder(
                      itemBuilder: (context,index){
                        return itemsearch(results : movieslist[index]);
                      },
                  itemCount: movieslist.length,
                ),
              );

            }),
    ]
    );
  }
}
