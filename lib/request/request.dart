import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
const baseUrl = "http://187.13.15.7:7844";

class API {
  static Future getAnimes(String id) async{
    String url;
    if (id == ''){
      url = baseUrl + "/api/anime/";
    }
    else{
      url = baseUrl + "/api/anime/"+id;
    }
    return await http.get(url);
  }
  static Future getVideos(String id) async{
    var url = baseUrl + "/api/video/anime/"+id;
    return await http.get(url);
  }
  
  static Future<String> getData() async{
    String url = baseUrl+"/api/anime/";
    http.Response response =await http.get(

        Uri.encodeFull(url),
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

class POST
{
  static Future lancamento() async{
    var url =baseUrl+'/api/anime/release';
    return await http.post(url);
  }
  static Future categoria() async{
    var url =baseUrl+'/api/anime/category';
    return await http.post(url);
  }

  static Future postLogin (senha, email) async {
    try{
    var url =baseUrl+'/api/User/id';
    var key = utf8.encode(senha);
    var hash = sha512.convert(key);

    Map data = {
      'Email': '$email',
      'Password': '$hash'
    };
    var body = json.encode(data);
    return await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
    }
    catch (error) {
      return false;
    }
  }

  static Future<http.Response> postcreate (nome, nick, senha, email) async {
    var key = utf8.encode(senha);
    var hash = sha512.convert(key);

    var url =baseUrl+'/api/User';

    Map data = {
      'Name': '$nome',
      'Nick': '$nick',
      'Password': '$hash',
      'Email': '$email',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}



class Shared{
  static Future getLogin(id,nome,nick,email,senha) async {
    final prefs = await SharedPreferences.getInstance();
    if(id == 1){
      final _id = prefs.getString('_id') ?? 'convidado';
      return _id;
    }
    else if(nome == 1){
      final name = prefs.getString('Name') ?? 'convidado';
      return name;
    }
    else if(nick == 1){
      final nick = prefs.getString('Nick') ?? 'convidado';
      return nick;
    }
    else if(email == 1){
      final emaill = prefs.getString('Email') ?? 'convidado';
      return emaill;
    }
    else if(senha == 1){
      final password = prefs.getString('Password') ?? 'convidado';
      return password;
    }
  }
  static Future getConfig(notifications, alertaAnimes, alertaMessages) async {
    final prefs = await SharedPreferences.getInstance();
    if(notifications == 1){
      final not = prefs.getBool('Notifications') ?? true;
      return not;
    }
    else if(alertaAnimes == 1){
      final alert = prefs.getBool('AlertaAnimes') ?? true;
      return alert;
    }
    else if(alertaMessages == 1){
      final messa = prefs.getBool('AlertaMessages') ?? true;
      return messa;
    }
  }
  static Future getTheme() async{
    final prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('Thema') ?? 'AppTheme.Original';
    return theme;
  }

}