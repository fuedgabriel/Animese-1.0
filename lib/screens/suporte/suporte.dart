

import 'package:flutter/material.dart';
import 'package:animese/widgets/menu.dart';
import 'package:animese/request/requestSupport.dart';


class Suporte extends StatefulWidget {
  @override
  _Suporte createState() => _Suporte();

}


class _Suporte extends State<Suporte> {
  var id;
  var tipo;
  var anime = 'Aplicativo';
  String motivo = 'Selecione o motivo';
  String problema = '';
  String observacao = 'Crie uma conta e tenha prioridade para os seus problemas!';
  TextEditingController _textFieldController = TextEditingController();



  _getId(){
    SUPORTINSERT.getLogin(1, 0, 0, 0, 0).then((response){
      setState(() {
        id = response;
        if(id!= 'convidado'){
          observacao = 'Prioridade ativada parabéns';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getId();

    return Scaffold(
      drawer: new MenuWidget(page: 'Suporte'),
      appBar: AppBar(
        title: Text('Suporte'),
      ),
      body: ListView(children: <Widget>[

        Column(children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.report_problem),
            title: Text(motivo),
            children: <Widget>[
              Divider(),
              ListTile(title: Text('Pedir para a dicionar anime'),
                onTap: (){
                  setState(() {
                    tipo = 0;
                    motivo = 'Pedir para a dicionar anime';
                    problema = 'Digite o nome do anime...';
                    observacao = 'ATENÇÃO: Digite somente o nome do anime para o seu pedido ser atendido.';
                  });
                },),
              Divider(),
              ListTile(title: Text('Erro no aplicativo'),
                onTap: (){
                  setState(() {
                    tipo = 1;
                    motivo = 'Erro no aplicativo';
                    problema = 'Escreva o ocorrido aqui...';
                    observacao = 'Descreva detalhadamente como o erro aconteceu. \nDescreva o passo a passo que ocasionou o erro.';
                  });
                },),
              Divider(),
              ListTile(title: Text('Problema com a conta de usuário'),
                onTap: (){
                  setState(() {
                    tipo = 2;
                    motivo = 'Problemas com a conta de usuário';
                    problema = 'Descreva o seu problema...';
                    observacao = '';
                  });
                },),
              Divider(),
              ListTile(title: Text('Melhorias no aplicativo'),
                onTap: (){
                  setState(() {
                    tipo = 3;
                    motivo = 'Melhorias no aplicativo';
                    problema = 'Conte-me...';
                    observacao = 'Conte-me mais sobre o que você gostria que melhorasse e\nNovas funções para o seu App';
                  });
                },),
              Divider(),
              ListTile(title: Text('Outros'),
                onTap: (){
                  setState(() {
                    tipo = 4;
                    motivo = 'Outros';
                    problema = 'Diga-me o ocorrido';
                    observacao = '';
                  });
                },),
            ],
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    hintText: problema,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                width: 250,
                child: Text(observacao,
                  style: TextStyle(fontSize: 18,),),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      //padding: EdgeInsets.only(left: 300.0, top: 400.0),
                      icon: Icon(Icons.send),
                      iconSize: 30.0,
                      onPressed: () {
                        if(tipo != null && _textFieldController.text != ''){
                          SUPORTINSERT.insert(id, tipo, anime, anime, _textFieldController.text);
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
                                          child: Text("Ok"),
                                          onPressed: () async{
                                            Navigator.of(context).pop();
                                          },)],
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16.0)),
                                      title: Text('Mensagem enviada',
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
                          _textFieldController.clear();
                          setState(() {
                            motivo = 'Selecione o motivo';
                          });

                        }
                        else
                          {
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
                                            child: Text("Ok"),
                                            onPressed: () async{
                                              Navigator.of(context).pop();
                                            },)],
                                        shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(16.0)),
                                        title: Text('Selecione uma opção ou digite uma mensagem.',
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
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
        )
      ],)
    );
  }
}
