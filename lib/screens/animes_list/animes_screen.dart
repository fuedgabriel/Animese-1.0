//widget
import '../../widgets/menu.dart';
import 'package:flutter/material.dart';
import 'widgets/content_scroll_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'listaHome.dart';
//json
import 'dart:convert';
import 'package:animese/request/Category.dart';
//request
import 'package:animese/request/ListPage.dart';
import 'package:animese/request/Animes.dart';
import 'package:animese/request/request.dart';






class AnimesScreen extends StatefulWidget {

  @override

  _AnimesScreenState createState() => _AnimesScreenState();
}


class _AnimesScreenState extends State<AnimesScreen> {
  List<String> categoryName = [];
  ListAnimePage page;
  var list = new List<ListAnime>();
  var animes = new List<ListAnime>();
  var controller = ScrollController();
  bool visibilidade = false;

  _getAnime(int pag){
    API.getAnimes('', pag).then((response){
      setState(() {
        Map decoded = json.decode(response.body);
        Iterable lista = decoded['docs'];
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
        animes.addAll(list.map((f) => f).toList());

      });
    });
  }



  @override
  void initState() {
    controller.addListener(() {
      if(mounted) {
        if(controller.position.pixels == controller.position.maxScrollExtent){
          pag = pag +1;
          _getAnime(pag);
        }
      }
    });
      super.initState();
      _getAnime(1);
    }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  int pag = 1;
  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Gujarat, India'),
          );
        },
      ),
    );
  }
  Widget build(BuildContext context) {



    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
//          onOpen: () => print('OPENING DIAL'),
//          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Menu',
//          backgroundColor: Colors.white,
//          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.all_inclusive),
                backgroundColor: Colors.red,
                label: 'Categoria',
                labelStyle: TextStyle(color: Colors.black),
                onTap: () async {
                  API.Categoria().then((response){
                    List<ListCategory> category;

                    Iterable lista = json.decode(response.body);
                    category = lista.map((model) => ListCategory.fromJson(model)).toList();
                    setState(() {
                      categoryName.addAll(category.map((f) => f.name).toList());
                    });
                  });
                  showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionBuilder: (context, a1, a2, widget) {
                        return Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: AlertDialog(
                              content: Container(
                                width: double.maxFinite,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                  itemCount: categoryName.length,
                                  itemBuilder: (BuildContext context, int index ){
                                    return GestureDetector(
                                      child: ListTile(
                                        title: Text(categoryName[index]
                                      ),),
                                      onTap: (){
                                        API.searchAnimeCategory(categoryName[index]).then((response){
                                          List<ListAnime> categoryList;
                                          Iterable lista = json.decode(response.body);
                                          categoryList = lista.map((model) => ListAnime.fromJson(model)).toList();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Screen(categoryList, categoryName[index]),),);
                                        });
                                      },
                                    );
                                  },
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

//                print(_theme);
//                _nameRetriever();
                },
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Lançamento',
              labelStyle: TextStyle(color: Colors.black),
              onTap: () {
                var listLancamento = new List<ListAnime>();
                POST.lancamento().then((response){
                  Iterable lika = json.decode(response.body);
                  listLancamento = lika.map((model) => ListAnime.fromJson(model)).toList();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen(listLancamento, 'Lançamento'),),);
                });
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.autorenew),
              backgroundColor: Colors.green,
              label: 'Populares',
              labelStyle: TextStyle(color: Colors.black,),
              onTap: () {

              },
            ),
          ],
        ),
      drawer: MenuWidget(page: 'Lista',),
      appBar: AppBar(
        elevation: 0,
        title: Text("Lista"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(animes.length.toString())
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Visibility(
            visible: visibilidade,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 500,
                    width: 180,
                    child: ListView(
                      children: <Widget>[
                        Text('oioi'),
                        Text('oioi'),
                        Text('oioi'),
                        Text('oioi'),
                      ],
                    ),
                    color: Colors.blue,
                  )
                ],
              )
          ),
          ContentScroll(images: animes, controller: controller,)
        ],
      )

    );
  }
}
