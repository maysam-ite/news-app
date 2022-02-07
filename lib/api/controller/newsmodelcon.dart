import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:news_ite/api/model/newsapp.dart';


class NewsController{
  static final NewsController _controller=NewsController._();
  NewsController._();
  factory NewsController(){
    return _controller;
  }
  Future<List<NewsApp>> getallnews(String type) async{
    var response =await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$type&apiKey=1b8f3626457347c3add742d607d2c44e'));
    Map<String,dynamic> data=jsonDecode(response.body);
    List<dynamic> articles=data['articles'];
    List<NewsApp> model=[];
    for(var i in articles){
      model.add(NewsApp.map(i));
    }
    return model;
  }
  Future<List<NewsApp>> getsearch({String type='',String l="en",String sort='PublishedAt'}) async{
    var response =await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$type&language=$l&apiKey=1b8f3626457347c3add742d607d2c44e'));
    Map<String,dynamic> data=jsonDecode(response.body);
    List<dynamic> articles=data['articles'];
    List<NewsApp> model=[];
    for(var i in articles){
      model.add(NewsApp.map(i));
    }
    return model;
  }
}