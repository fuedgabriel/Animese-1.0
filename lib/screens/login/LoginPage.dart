

import 'dart:async';
import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import 'createcount.dart';
import 'recoverpassword.dart';





class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  var user;
  bool answer;
  _saveLogin(email,nome,nick,senha, id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Email', email);
    prefs.setString('Name', nome);
    prefs.setString('Nick', nick);
    prefs.setString('Password', senha);
    prefs.setString('_id', id);
  }

  bool _obscureText = true;


  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }






  TextEditingController _textFieldControllerEmail = TextEditingController();
  TextEditingController _textFieldControllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double font = 18;
    double fontfb = 16;
    var width = MediaQuery.of(context).size.width;
    print(width);
    if(width<360){
      font = 13;
      fontfb = 13;
    }
    return Scaffold(
      drawer: MenuWidget(page: 'Login',),
      appBar: AppBar(
        title: Text('Login'),

      ),

      body: Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 30,
          right: 30,
        ),
//        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(width: 512, height: 256, child: Image.asset('assets/animese/nomeLogo.png'),),


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
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Stack(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    controller: _textFieldControllerSenha,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                         onPressed: _toggle,
                         child: new Text(_obscureText ? "Amostrar" : "Ocultar")
                     ),
                   ],
                 )

                ],
              )
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontSize: font,
                      ),
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
                  FlatButton(
                    child: Text(
                      'Recuperar Senha',
                      style: TextStyle(
                        fontSize: font,
                      ),
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
                ],
              ),
            ),

            SizedBox(height: 05,),

            Container(
              height: 40,
              child: OutlineButton(
                onPressed: () {
                  POST.postLogin(_textFieldControllerSenha.text,_textFieldControllerEmail.text).then((response){
                    var user = json.decode(response.body);
                    if((user[0]) != null) {
                      _saveLogin(
                          user[0]['Email'], user[0]['Name'], user[0]['Nick'], user[0]['Password'],
                          user[0]['_id']);
                      answer = true;

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
                      Future.delayed(Duration(milliseconds: 1200), () {
                        Navigator.of(context).pop();
                      });
                      Timer(Duration(milliseconds: 1400), () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
                      });
                    }
                    else{
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
                  }

                  );
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                borderSide: BorderSide(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            child: Image.asset('assets/animese/Icon.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Efetuar login',
                          style: TextStyle(
                            fontSize: 16,
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
                            fontSize: 16,
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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: fontfb,
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
