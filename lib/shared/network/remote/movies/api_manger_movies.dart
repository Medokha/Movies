import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/shared/components/components.dart';

import '../../../../models/Movies/categorymovies.dart';


class Apimangermovies {
  late String query;
  static const String BASE ='api.themoviedb.org';
  static Future<Categorymovies> getsources(BuildContext context) async{
    var URL =Uri.https(BASE, '/3/genre/movie/list',{
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
    Categorymovies sourcesResponse=Categorymovies.fromJson(json);
    return sourcesResponse;
  }
}