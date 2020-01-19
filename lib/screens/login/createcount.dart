import 'package:flutter/material.dart';
import 'package:animese/request/request.dart';
import 'dart:async';





class CreateCount extends StatefulWidget {
  @override
  _CreateCount createState() => _CreateCount();
}



class _CreateCount extends State<CreateCount>{
  String birthDateInString;
  String initValue="Select your Birth Date";
  bool isDateSelected= false;
  DateTime birthDate; // instance of DateTime
  String dia = '0';
  String mes = '00';
  String ano = '0000';



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
    double font = 18;
    double fontfb = 16;
    double size = 48;
    var width = MediaQuery.of(context).size.width;
    if(width<=360){
      font = 13;
      fontfb = 11;
      size = 30;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
      ),
      body: ListView(children: <Widget>[
        SizedBox(height: 20,),
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
            obscureText: true,
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
            obscureText: true,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0),
          child: Text('Data de nascimento'),
        ),

        Padding(padding: EdgeInsets.symmetric(horizontal: 45.0),
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                child: new Icon(Icons.calendar_today,size: size,),
                onTap: ()async{
                  final datePick= await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1940),
                      lastDate: new DateTime(2022)
                  );
                  if(datePick!=null && datePick!=birthDate){
                    setState(() {
                      birthDate=datePick;
                      isDateSelected=true;
                      birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                      dia = birthDate.day.toString();
                      mes = birthDate.month.toString();
                      ano = birthDate.year.toString();

                    });
                  }
                }
            ),
            GestureDetector(
              child: Text('      '+dia.toString()+' / '+mes.toString()+' / '+ano.toString(),
                style: TextStyle(
                    fontSize: font
                ),
              ),
                onTap: ()async{
                  final datePick= await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1940),
                      lastDate: new DateTime(2022)
                  );
                  if(datePick!=null && datePick!=birthDate){
                    setState(() {
                      birthDate=datePick;
                      isDateSelected=true;
                      birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                      dia = birthDate.day.toString();
                      mes = birthDate.month.toString();
                      ano = birthDate.year.toString();

                    });
                  }
                }
            ),
            GestureDetector(
                child: Text('  (DD/MM/AAAA)',
                  style: TextStyle(
                    fontSize: fontfb,
                    fontStyle: FontStyle.italic,
                  ),),
                onTap: ()async{
                  final datePick= await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1940),
                      lastDate: new DateTime(2020)
                  );
                  if(datePick!=null && datePick!=birthDate){
                    setState(() {
                      birthDate=datePick;
                      isDateSelected=true;
                      birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                      dia = birthDate.day.toString();
                      mes = birthDate.month.toString();
                      ano = birthDate.year.toString();

                    });
                  }
                }
            ),


          ],
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
              if(_textFieldControllerNome.text.isEmpty || _textFieldControllerNick.text.isEmpty || _textFieldControllerEmail.text.isEmpty || _textFieldControllerSenha1.text.isEmpty || _textFieldControllerSenha2.text.isEmpty){
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {Navigator.of(context).pop(); },
                              )
                            ],
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            title: Text('Por favor, preencha todos os valores.',
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
              else if(_textFieldControllerSenha1.text != _textFieldControllerSenha2.text){

                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {Navigator.of(context).pop(); },
                              )
                            ],
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            title: Text('As senhas não correspondem',
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

              else if(dia.toString() != '0'){
                POST.postcreate(_textFieldControllerNome.text, _textFieldControllerNick.text, _textFieldControllerSenha1.text, _textFieldControllerEmail.text);
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
              else{
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {Navigator.of(context).pop(); },
                              )
                            ],
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            title: Text('Por favor, preencha a data de nascimento.',
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
        SizedBox(height: 20,),
      ],
      )
    );
  }
}
