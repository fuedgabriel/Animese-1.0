import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
import 'package:imperium/screens/Matter.dart';
class Lessons extends StatefulWidget {
  @override
  _Lessons createState() => _Lessons();
}

class _Lessons extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    List<String> title = ['Filosofia', 'Portguês', 'Redação', 'Medicina', 'Biologia', 'Matemática','Física'];
    List<String> img = ['socrates','portugues','redacao','medicina','biologia','matematica','fisica'];
    List<String> state = ['Novas tarefas', 'Concluido', 'Novas tarefas', 'Concluido', 'Concluido', 'Concluido', 'Concluido', ];



    return Scaffold(
      drawer: MenuWidget(page: '',),
      appBar: AppBar(
        title: Text('Matérias'),
      ),
      body: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index){
          Color cor;
          if(state[index] == 'Concluido'){
            cor = Colors.green;
          }
          else{
            cor = Colors.yellowAccent;
          }

          var ListMatters = ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.black26))),
              child: Image.asset('src/image/'+img[index]+'.png'),
            ),
            title: Text(
              title[index],
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale, color: cor),
                Text(" "+state[index], style: TextStyle(color: Colors.black))
              ],
            ),
            trailing: GestureDetector(child: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
              onTap: (){
              if(title[index] == 'Filosofia'){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Matter(),
                  ),
                );
              }else{

              }

              },),
          );
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: ListMatters,
            ),
          );
        }
      ),
    );
  }
}
