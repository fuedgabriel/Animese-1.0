

import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/widgets/menu.dart';

class Suporte extends StatefulWidget {
  @override
  _Suporte createState() => _Suporte();


}

class _Suporte extends State<Suporte> {
  String motivo = 'Selecione o motivo';
  String problema = '';
  String observacao = '';
  TextEditingController _textFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //get the screen size
    double aspect = 1;

    if((size.width / size.height) > 1.76){
      aspect = 16 / 9;
    }else if((size.width / size.height) < 1.77 && (size.width / size.height) >= 1.6){
      aspect = 16 / 10;
    }else{
      aspect = 4 /3;
    }
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
                    motivo = 'Pedir para a dicionar anime';
                    problema = 'Digite o nome do anime...';
                    observacao = 'ATENÇÃO: Digite somente o nome do anime para o seu pedido ser atendido.';
                  });
                },),
              Divider(),
              ListTile(title: Text('Erro no aplicativo'),
                onTap: (){
                  setState(() {
                    motivo = 'Erro no aplicativo';
                    problema = 'Escreva o ocorrido aqui...';
                    observacao = 'Descreva detalhadamente como o erro aconteceu. \nDescreva o passo a passo que ocasionou o erro.';
                  });
                },),
              Divider(),
              ListTile(title: Text('Problema com a conta de usuário'),
                onTap: (){
                  setState(() {
                    motivo = 'Problemas com a conta de usuário';
                    problema = 'Descreva o seu problema...';
                    observacao = '';
                  });
                },),
              Divider(),
              ListTile(title: Text('Melhorias no aplicativo'),
                onTap: (){
                  setState(() {
                    motivo = 'Melhorias no aplicativo';
                    problema = 'Conte-me...';
                    observacao = 'Conte-me mais sobre o que você gostria que melhorasse e\nNovas funções para o seu App';
                  });
                },),
              Divider(),
              ListTile(title: Text('Outros'),
                onTap: (){
                  setState(() {
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
              Padding(
                padding: EdgeInsets.only(left: 290.0, top: 190.0),
                child: IconButton(
                  //padding: EdgeInsets.only(left: 300.0, top: 400.0),
                  icon: Icon(Icons.send),
                  iconSize: 30.0,
                  onPressed: () =>{
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                              title: Text("Mensagem enviada"));})
                  },
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
