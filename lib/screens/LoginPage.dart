import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  var user;
  bool answer;

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
    double font = 17;
//    double fontfb = 16;
    var width = MediaQuery.of(context).size.width;

    if(width<360){
      font = 13;
//      fontfb = 13;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Imperium concursos'),

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
            SizedBox(width: 512, height: 200, child: Image.asset('src/image/logo-horizontal.png'),),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: TextField(
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: _textFieldControllerEmail,
                decoration: InputDecoration(
                  hintText: "Matrícula",
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

                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 25,),
            Container(
              height: 40,
              child: OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                borderSide: BorderSide(),
                child: Center(
                  child: Text(
                    'Efetuar login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ),
            ),


          ],
        ),

      ),
    );
  }
}
