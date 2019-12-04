import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const baseUrl = "http://192.168.0.191:7844";

class API {
  static Future getAnimes() async{
    var url = baseUrl + "/api/anime/";
    return await http.get(url);
  }
  
  static Future<String> getData() async{
    http.Response response =await http.get(
        Uri.encodeFull("http://192.168.0.191:7844/api/anime/"),
      headers:
      {
          "Accept": "application/json"
      },
    );
//    print(response.body);
    List data = json.decode(response.body);
    return data.toString(); // adicionado por mim
    //Autogenerated.fromJson(data[0]);

    
  }



}