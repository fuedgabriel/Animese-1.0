

import 'package:flutter/material.dart';

class CreateCount extends StatefulWidget {
  @override
  _CreateCount createState() => _CreateCount();
}

class _CreateCount extends State<CreateCount> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 40,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: TextField(
            controller: _textFieldController,
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
            controller: _textFieldController,
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
            controller: _textFieldController,
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
            controller: _textFieldController,
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
          height: 40,
          child: OutlineButton(
            onPressed: () {},
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
