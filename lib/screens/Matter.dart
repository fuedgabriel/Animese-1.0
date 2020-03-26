import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Matter extends StatefulWidget {
  @override
  _MatterState createState() => _MatterState();
}

class _MatterState extends State<Matter> {
  List<String> title = ['O Julgamento de Sócrates', 'Futebol Filosófico', 'Lista de exercícios'];
  List<String> description = ['Cena retirada do filme: "Sócrates"\nLivro: "Apologia de Sócrates"',
    'Disputa de futebol entre os filósofos da Alemanha e da Grécia.', 'O Surgimento da sociologia.'];
  List<String> document = ['https://www.youtube.com/watch?v=m8uEPvl-l5M','https://www.youtube.com/watch?v=2OrcQIweUoQ', 'https://drive.google.com/open?id=1ntdXE_QmehtqbQjiEsKm_wOOEaoYds7P'];
  List<String> icon = ['youtubepng', 'youtubepng', 'pdf'];

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Colors.deepPurple),
              gapPadding: 5
            ),
            elevation: 10,
            title: Text('Digite sua dúvida'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              showCursor: true,
              enableSuggestions: true,
              autocorrect: true,

            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('Enviar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text('Voltar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Sala de aula'),
        ),
        body: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(title[index]),
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    title.removeAt(index);
                  });
                  },
                direction: DismissDirection.endToStart,
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(title[index],),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                  child: Container(
                                    width: 260,
                                    child: Text(description[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 48, 48, 54)
                                      ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 100.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage("src/image/"+icon[index]+".png")
                                )
                            ),
                          ),
                          onTap: () {
                            _launchURL(document[index]);
                          },
                          onLongPress: (){
                            _displayDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
    );
  }
}