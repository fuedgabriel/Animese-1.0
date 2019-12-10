import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
import 'dart:async';





class CreateCount extends StatefulWidget {
  @override
  _CreateCount createState() => _CreateCount();
}



class _CreateCount extends State<CreateCount>{

  AnimationController controller;

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }


  TextEditingController _textFieldControllerNome = TextEditingController();
  TextEditingController _textFieldControllerNick = TextEditingController();
  TextEditingController _textFieldControllerEmail = TextEditingController();
  TextEditingController _textFieldControllerSenha1 = TextEditingController();
  TextEditingController _textFieldControllerSenha2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
      ),
      body: ListView(children: <Widget>[
        SizedBox(height: 40,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextField(
            controller: _textFieldControllerNome,
            decoration: InputDecoration(
              hintText: "Nome",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextField(
            controller: _textFieldControllerNick,
            decoration: InputDecoration(
              hintText: "Nick",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextFormField(
            validator: _validarEmail,
            controller: _textFieldControllerEmail,
            decoration: InputDecoration(
              hintText: "E-mail",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextField(
            controller: _textFieldControllerSenha1,
            decoration: InputDecoration(
              hintText: "Senha",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextField(
            controller: _textFieldControllerSenha2,
            decoration: InputDecoration(
              hintText: "Senha",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          height: 40,
          child: OutlineButton(
            onPressed: () {



              if(_textFieldControllerSenha1.text == _textFieldControllerSenha2.text){
                POST.postcreate(_textFieldControllerNome.text,_textFieldControllerNick.text, _textFieldControllerSenha1.text, _textFieldControllerEmail.text);
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
                            title: Text('Cadastro efetuado com sucesso',
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
                Timer(Duration(milliseconds: 1800), () {
                  Navigator.of(context).pop();
                });
               }
              else
                {
                print('else');
                Dialog(child: Text('aaa'),);
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
                      'Efetuar cadastro',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      )
    );
  }
}
