//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animese/request/Animes.dart';
import 'package:animese/request/requestSupport.dart';


// ignore: must_be_immutable
class SuporteAnime extends StatefulWidget {
  ListAnime movieA;
  SuporteAnime({this.movieA});
  @override
  _SuporteAnime createState() => _SuporteAnime();

}

class _SuporteAnime extends State<SuporteAnime> {
  var id;
  var tipo;
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
                ListTile(title: Text('Faltando Episódio'),
                  onTap: (){
                    setState(() {
                      tipo = 5;
                      motivo = 'Faltando Episódio';
                      problema = 'Anime: '+widget.movieA.title + '\nDigite o qual episódio está faltando...';
                      observacao = 'Conte-nos o episódio que está faltando.\n';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Episódio inlegivel'),
                  onTap: (){
                    setState(() {
                      tipo = 6;
                      motivo = 'Episódio inlegivel';
                      problema = 'Anime: '+widget.movieA.title+'\nEpisódio inlegivel-> ex:01 e 02 ou todos...';
                      observacao = 'Conte-nos qual episódio está inlegivel.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Erro na reprodução do anime'),
                  onTap: (){
                    setState(() {
                      tipo = 7;
                      motivo = 'Erro na reprodução do anime';
                      problema = 'Anime: '+widget.movieA.title+'\nErro na reproduçãol -> ex:01 e 02 ou todos...';
                      observacao = 'Conte-nos qual episódio ou anime está não está dando erro.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Descrição está incorreta'),
                  onTap: (){
                    setState(() {
                      tipo = 8;
                      motivo = 'Descrição está incorreta';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos como deveria ser a descrição para uma melhor avaliação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Categoria está incorreta'),
                  onTap: (){
                    setState(() {
                      tipo = 9;
                      motivo = 'Categoria está incorreta';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos como deveria ser a vategoria para uma melhor avaliação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Conteudo sexual'),
                  onTap: (){
                    setState(() {
                      tipo = 10;
                      motivo = 'Conteudo sexual';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos a sua indgnação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Conteudo violento ou repulsivo'),
                  onTap: (){
                    setState(() {
                      tipo = 11;
                      motivo = 'Conteudo violento ou repulsivo';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos a sua indgnação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Outros'),
                  onTap: (){
                    setState(() {
                      tipo = 12;
                      motivo = 'Outros';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos o ocorrido';
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
                        onPressed: () =>{
                          if(tipo != null){
                            SUPORTINSERT.insert(id, tipo, widget.movieA.title, widget.movieA.sId, _textFieldController.text),
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
                                pageBuilder: (context, animation1, animation2) {var a; return a; }),
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
                                          title: Text('Selecione uma opção',
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
                                  pageBuilder: (context, animation1, animation2) {var a; return a; }),
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



//      body: Container(
//        child: Column(
//          children: <Widget>[
//            ListView(
//              shrinkWrap: true,
//              children: <Widget>[
//                ExpansionTile(
//
//                  leading: Icon(Icons.report_problem),
//                  title: Text('Selecione o motivo'),
//                  children: <Widget>[
//                    ListTile(title: Text('Episódio inlegível')),
//                    ListTile(title: Text('Faltando episódios')),
//                    ListTile(title: Text('Conteudo sexual')),
//                    ListTile(title: Text('Conteudo violento ou repulsivo')),
//                    ListTile(title: Text('Descrição está errada')),
//                    ListTile(title: Text('Categoria está errada')),
//                  ],
//                ),
//                ExpansionTile(
//                  title: Text('Test2'),
//                  children: <Widget>[
//                    ListTile(title: Text('Title of the item')),
//                    ListTile(
//                      title: Text('Title of the item2'),
//                    )
//                  ],
//                )
//              ],
//            ),
//            Divider(),
//            Padding(
//              padding: EdgeInsets.only(left: 300.0, top: 370.0),
//              child: IconButton(
//                //padding: EdgeInsets.only(left: 300.0, top: 400.0),
//                icon: Icon(Icons.send),
//                iconSize: 30.0,
//                onPressed: () =>
//                {
//                  print('teste')
//                },
//              ),
//            ),
////            Container(
////              height: 120.0,
////              child: SingleChildScrollView(
////                child: Text(
////                  widget.movieA.description,
////                  style: TextStyle(
////                    color: Colors.black54,
////                  ),
////                ),
////              ),
////            ),
//          ],
//        ),
//      ),

