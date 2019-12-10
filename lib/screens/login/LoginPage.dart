

import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Usuario.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import 'createcount.dart';
import 'recoverpassword.dart';





class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  var user = new List<User>();
  _getUser(senha, email){
    try
    {
      POST.postLogin(senha,email).then((response){
        Iterable lista = json.decode(response.body);
        user = lista.map((model) => User.fromJson(model)).toList();

      }
      );
      if(user[0].name != null) {
      print(user[0].name);
      _saveLogin(user[0].email,user[0].name,user[0].nick ,user[0].password, user[0].sId);
      return true;
    }
    else {
      return false;
      }
    }catch (error) {
      return false;
    }
  }
  _saveLogin(email,nome,nick,senha, id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Email', email);
    prefs.setString('Name', nome);
    prefs.setString('Nick', nick);
    prefs.setString('Password', senha);
    prefs.setString('_id', id);
  }






  TextEditingController _textFieldControllerEmail = TextEditingController();
  TextEditingController _textFieldControllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(page: 'Login',),
      appBar: AppBar(
        title: Text('Login'),

      ),

      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
//        color: Colors.white,
        child: ListView(
          children: <Widget>[

            SizedBox(width: 128, height: 128, child: Image.asset('assets/logos/logo.png'),),

            SizedBox(height: 20,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: TextField(
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: _textFieldControllerEmail,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
           // title: 'My List',
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: TextField(
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: _textFieldControllerSenha,
                decoration: InputDecoration(
                  hintText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),

            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: FlatButton(
                      child: Text(
                        'Cadastre-se         ',
                      ),
                      onPressed: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateCount(),
                          ),
                        );



                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        'Recuperar Senha',
                      ),
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecoverPassword(),
                          ),
                        );

                      },
                    ),
                  )

                ],
              ),
            ),

            SizedBox(height: 05,),

            Container(
              height: 40,
              child: OutlineButton(
                onPressed: () {
                  var request = _getUser(_textFieldControllerSenha.text, _textFieldControllerEmail.text);
                  print(request);
                  print("_______________________________________");
                  if(request==true){
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                title: Text('Login efetuado com sucesso',
                                  style: TextStyle(
                                    fontSize: 15.6,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {var a; return a; });
                    Future.delayed(const Duration(milliseconds: 1200), () {
                      Navigator.of(context).pop();
                    });
                    Timer(Duration(milliseconds: 1400), () {
                      Navigator.of(context).pop();
                    });
                  }
                  else {
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                title: Text('Login ou senha está incorreto',
                                  style: TextStyle(
                                    fontSize: 15.6,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {var a; return a; });
                  }

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                borderSide: BorderSide(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Efetuar login',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 05,),

            Container(
              height: 40,
              child: OutlineButton(
                splashColor: Colors.grey,
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                borderSide: BorderSide(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage("assets/logos/google.png"), height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Entrar com o Google',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                     )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 05,),

            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0XFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: SizedBox(
                            child: Image.asset('assets/logos/facebook.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Entrar com o Facebook',
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => {},
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
