import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.0.191:444";

class API {
  static Future getAnimes() async{
    var url = baseUrl + "/api/anime/";
    return await http.get(url);
  }
}
