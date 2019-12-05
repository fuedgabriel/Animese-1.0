

import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/request.dart';
class CreateCount extends StatefulWidget {
  @override
  _CreateCount createState() => _CreateCount();
}

class _CreateCount extends State<CreateCount> {
  TextEditingController _textFieldControllerNome = TextEditingController();
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
                print(_textFieldControllerNome.text);
                print(_textFieldControllerEmail.text);
                print(_textFieldControllerSenha1.text);
                POST.postContact(_textFieldControllerNome.text.toString(), _textFieldControllerEmail.text.toString(), _textFieldControllerSenha1.text.toString());
               }
              else{
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
                  )
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
