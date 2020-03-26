
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:imperium/request/request.dart';
class Answers extends StatefulWidget {
  String Matter;
  Answers(this.Matter);
  @override
  _Answers createState() => _Answers();
}
enum SingingCharacter { A, B, C, D, E, F }

class _Answers extends State<Answers> {
  SingingCharacter _character;

  String Questions = 'Quais são os elemtos constitutivos de um Estado?';
  List<String> anwser = ['Clima, Geografia e localização', 'Povo Território e soberania', 'Voto, democracia e cidadania', 'Nação, cultura e idioma', 'Fidelidade, patriotismo, e governo totalitário'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex('#48006d'),
        elevation: 0,
        title: Text(widget.Matter),
        actions: <Widget>[

        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10, right: 10,left: 10),
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Text(
                      'Questão '+Questions.length.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.blue[700],
                      ),
                    ),
                    Text(
                      'Questão '+Questions.length.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          Container(
            width: 180,
            child: Center(
              child: Text(
                Questions,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            height: 300,
            child: Card(
              elevation: 5,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: anwser.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(anwser[index],
                        style: TextStyle(
                          fontSize: 13
                        ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[index],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      );
                    },
                  )
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            onPressed: (){
              POST.postcreate('Quais são os elemtos constitutivos de um Estado?', 1, 0);
              AchievementView(
                  context,
                  title: "Parabéns!",
                  subTitle: "A resposta está correta",
                  icon: Icon(Icons.insert_emoticon, color: Colors.white,),
                  borderRadius: 5.0,
                  color: Colors.green,
                  textStyleTitle: TextStyle(),
                  //textStyleSubTitle: TextStyle(),
                  alignment: Alignment.topCenter,
                  duration: Duration(seconds: 2),
                  isCircle: true,
//                  listener: (status){
//                    print(status);
//                    //AchievementState.opening
//                    //AchievementState.open
//                    //AchievementState.closing
//                    //AchievementState.closed
//                  }
              )..show();

            },
            child: Text("Próximo"),
          ),
        ],
      ),
    );
  }
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
