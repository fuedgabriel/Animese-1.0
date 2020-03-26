import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
import 'Answers.dart';
import 'package:imperium/request/request.dart';
class Questions extends StatefulWidget {
  @override
  _Questions createState() => _Questions();
}

class _Questions extends State<Questions> {

  List<String> title = ['Filosofia', 'Portguês', 'Redação', 'Medicina', 'Biologia', 'Matemática','Física'];
  List<String> img = ['socrates','portugues','redacao','medicina','biologia','matematica','fisica'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(page: 'Home',),
      appBar: AppBar(
        title: Text('Perguntas e respostas'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 0,),
          scrollDirection: Axis.vertical,
          itemCount: img.length,
          itemBuilder: (context, index) {
            return Center(
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(4)),
                  Container(
                    width: 130,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: 90,
                            child: GestureDetector(
                              child: Image(
                                image: AssetImage('src/image/'+img[index]+'.png'),
                                fit: BoxFit.contain,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Answers(
                                            title[index]
                                        )
                                    )
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Text(
                              title[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
    );
  }
}
