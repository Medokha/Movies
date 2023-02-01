import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/shared/components/components.dart';

import '../../../../models/Movies/searchcatedory.dart';
import '../../../../models/search/SearchResponse.dart';

class Apimanger {
  late String query;
  static const String BASE ='api.themoviedb.org';
  static Future<Searchresponse> getsources(BuildContext context,String q) async{
    var URL =Uri.https(BASE, '/3/search/movie',{
      "api_key":"3505a228d57ab4b13ce646bc6291ff0a",
      "query" : q,
    });
    Response? sources;
    try{
      sources =await http.get(URL);
    }
    catch(e){
      showmassage(context, 'error', 'OK', () {
        Navigator.pop(context);
      });
    }
    var json =jsonDecode(sources!.body);
    Searchresponse sourcesResponse=Searchresponse.fromJson(json);
    return sourcesResponse;
  }
}
class Apimangerseachmovies {
  late String query;
  static const String BASE ='api.themoviedb.org';
  static Future<Searchcatedory> getsources(BuildContext context) async{
    var URL =Uri.https(BASE, '/3/discover/movie',{
      "api_key":"3505a228d57ab4b13ce646bc6291ff0a",
    });
    Response? sources;
    try{
      sources =await http.get(URL);
    }
    catch(e){
      showmassage(context, 'error', 'OK', () {
        Navigator.pop(context);
      });
    }
    var json =jsonDecode(sources!.body);
    Searchcatedory sourcesResponse=Searchcatedory.fromJson(json);
    return sourcesResponse;
  }
}