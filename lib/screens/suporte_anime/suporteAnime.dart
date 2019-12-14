//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';



// ignore: must_be_immutable
class SuporteAnime extends StatefulWidget {
  ListAnime movieA;
  SuporteAnime({this.movieA});
  @override
  _SuporteAnime createState() => _SuporteAnime();

}

class _SuporteAnime extends State<SuporteAnime> {
  String motivo = 'Selecione o motivo';
  String problema = '';
  String observacao = '';
  TextEditingController _textFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                      motivo = 'Faltando Episódio';
                      problema = 'Anime: '+widget.movieA.title + '\nDigite o qual episódio está faltando...';
                      observacao = 'Conte-nos o episódio que está faltando.\n';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Episódio inlegivel'),
                  onTap: (){
                    setState(() {
                      motivo = 'Episódio inlegivel';
                      problema = 'Anime: '+widget.movieA.title+'\nEpisódio inlegivel-> ex:01 e 02 ou todos...';
                      observacao = 'Conte-nos qual episódio está inlegivel.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Erro na reprodução do anime'),
                  onTap: (){
                    setState(() {
                      motivo = 'Erro na reprodução do anime';
                      problema = 'Anime: '+widget.movieA.title+'\nErro na reproduçãol -> ex:01 e 02 ou todos...';
                      observacao = 'Conte-nos qual episódio ou anime está não está dando erro.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Descrição está incorreta'),
                  onTap: (){
                    setState(() {
                      motivo = 'Descrição está incorreta';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos como deveria ser a descrição para uma melhor avaliação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Categoria está incorreta'),
                  onTap: (){
                    setState(() {
                      motivo = 'Categoria está incorreta';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos como deveria ser a vategoria para uma melhor avaliação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Conteudo sexual'),
                  onTap: (){
                    setState(() {
                      motivo = 'Conteudo sexual';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos a sua indgnação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Conteudo violento ou repulsivo'),
                  onTap: (){
                    setState(() {
                      motivo = 'Conteudo violento ou repulsivo';
                      problema = 'Anime: '+widget.movieA.title+'...';
                      observacao = 'Conte-nos a sua indgnação.';
                    });
                  },),
                Divider(),
                ListTile(title: Text('Outros'),
                  onTap: (){
                    setState(() {
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
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                    title: Text("Mensagem enviada"));})
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

