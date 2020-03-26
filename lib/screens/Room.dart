import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium/screens/Lessons.dart';
import 'package:imperium/widgets/menu.dart';
import 'package:slimy_card/slimy_card.dart';

class Room extends StatefulWidget {
  @override
  _Room createState() => _Room();
}

class _Room extends State<Room> {
  Animation<double> arrowAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(page: 'Room',),
      appBar: AppBar(
        title: Text('Sala de aula'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0),),
          SlimyCard(
            color: Colors.red,
            width: 330,
            topCardHeight: 200,
            borderRadius: 20,
            topCardWidget: topCardWidget('src/image/enem.png'),
            bottomCardWidget: bottomCardWidget('Filosofia: "a apologia de Sócrates" \n Tema de redação: "A importância da educação financeira"'),
            slimeEnabled: true,
          ),
          SizedBox(height: 15),

          SlimyCard(
            color: Colors.green,
            width: 330,
            topCardHeight: 200,
            borderRadius: 20,
            topCardWidget: topCardWidgetMed('src/image/enem.png'),
            bottomCardWidget: bottomCardWidget('Sem atualizações recentes'),
            slimeEnabled: true,
          ),

        ],
      ),
    );
  }
  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Enem - Tarde',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          'Você possui novas notficações',
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget topCardWidgetMed(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Medicina - Noite',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          'Tarefas concluidas',
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget(String texto) {
    return ListView(
      children: <Widget>[
        Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ],
                ), // make rounded corner
                child: Icon(Icons.arrow_forward_ios),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lessons(),
                  ),
                );
              },
            ),
          ],
        )


      ],
    );
  }
}

