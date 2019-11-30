import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.0.191:444";

class API {
  static Future getAnimes() async{
    var url = baseUrl + "/api/anime/";
    return await http.get(url);
  }

//  static PostSend(String User, String Password, String Email){
//    var _url = Uri.parse('http://$baseurl/chat/messages/send');
//
//    var request = new http.MultipartRequest('POST', _url);
//    request.fields['json'] = json;
//    request.files.add(new http.MultipartFile.fromString(widget.mychat.msgkey, myimagefile.path));
//  }
}
