import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts/app/modules/home/model/newsModel.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  // Initial Selected Value
  String dropdownvalue = 'national';

  // List of items in our dropdown menu
  var items = [
    'all',
    'national',
    'business',
    'sports',
    'world',
    'politics',
    'technology',
    'startup',
    'entertainment',
    'miscellaneous',
    'hatke',
    'science',
    'automobile',
  ];

  Future<NewsModel> fetchNews() async{
    final response = await http.get(Uri.parse("https://inshortsapi.vercel.app/news?category=$dropdownvalue"));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return NewsModel.fromJson(data);
      }else{
        throw Exception('Failed to load news');
      }
    }catch (e){
      throw Text("Error");
    }

  }

}
