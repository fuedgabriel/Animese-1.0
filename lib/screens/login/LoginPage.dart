import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';
import 'package:http/http.dart';
import 'createcount.dart';
import 'recoverpassword.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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

            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
//                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
            ),
           // title: 'My List',
            TextFormField(
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
//                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
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
                            builder: (context) => createcount(),
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
                            builder: (context) => recoverpassword(),
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
