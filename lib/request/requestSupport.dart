import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
const baseUrl = "http://187.13.15.7:7844";


class SUPORTINSERT{
  static Future<http.Response> insert (id, tipo, anime, idanime, menssagem) async {

    var url =baseUrl+'/api/Support';

    Map data = {
      'Id_User': '$id',
      'Tipo': '$tipo',
      'Anime': '$anime',
      'IdAnime': '$idanime',
      'Message': '$menssagem',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    return response;
  }

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

}