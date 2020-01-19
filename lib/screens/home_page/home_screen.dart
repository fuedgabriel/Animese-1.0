//widget

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/video/movie_screen.dart';
import 'widgets/content_scroll.dart';
import '../../widgets/menu.dart';

//request
import 'package:animese/request/Usuario.dart';
import '../../request/request.dart';
import '../../request/Animes.dart';
import 'package:device_info/device_info.dart';
//json
import 'dart:convert';

//tema
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/theme/app_themes.dart';
import '../config/theme/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  var list = new List<ListAnime>();
  var listLancamento = new List<ListAnime>();
  var listCategoria = new List<ListAnime>();
  var user = new List<User>();
  List nome;
  List id;
  List url;
  List ep;
  String theme;
  List<String> recent;
  final itemAppTheme = AppTheme.values;

  var listFavoritos = new List<ListAnime>();
  ListAnime lisa;

  _getFavoritos() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List animes = prefs.getStringList('favoritos');
    for(int i = 0;i < animes.length; i++){
      API.getAnimes(animes[i], 0).then((response){
        setState(() {
          final json = jsonDecode(response.body);
          lisa = ListAnime.fromJson(json);
          listFavoritos.add(lisa);
        });
      });
    }
  }

  _getAnime(){
    API.getAnimes('', 1).then((response){
      setState(() {
        Map decoded = json.decode(response.body);
        Iterable lista = decoded['docs'];
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
        id = list.map((f) => f.sId).toList();
        ep = list.map((f) => f.episodes).toList();
        url = list.map((f) => f.url).toList();
      });
    });
  }
  _getLancamento(){
    POST.lancamento().then((response){
      setState(() {
        Iterable lika = json.decode(response.body);
        listLancamento = lika.map((model) => ListAnime.fromJson(model)).toList();
      });
    });
  }
  _getCategoria(){
    POST.categoria().then((response){
      setState(() {
        Iterable cate = json.decode(response.body);
        listCategoria = cate.map((model) => ListAnime.fromJson(model)).toList();
      });
    });
  }
  _recentAnimes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recent = prefs.getStringList('lista');
    if(recent == null){
      recent = [];
    }
    Iterable<String> a = recent.reversed;
  }


  _thema()async{
    Shared.getTheme().then((resp){
      setState(() {
        theme = resp;
      });
      for(int i=0;i< itemAppTheme.length; i++){
        if(itemAppTheme[i].toString() == theme){
          BlocProvider.of<ThemeBloc>(context).dispatch(
            ThemeChanged(theme: itemAppTheme[i]),
          );
        }
      }
    });
  }
  _device() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
//    print('Running on ${androidInfo.id}');
//    print('Running on ${androidInfo.androidId}');
//    print('Running on ${androidInfo.device}');
//    print('Running on ${androidInfo.display}');
//    print('Running on ${androidInfo.version}');
//    print('Running on ${androidInfo.type}');
//    print('Running on ${androidInfo.bootloader}');
//    print('Running on ${androidInfo.hardware}');
//    print('Running on ${androidInfo.host}');
//    print('Running on ${androidInfo.product}');
  }


  _HomeScreenState(){
    _getLancamento();
    _getAnime();
    _getFavoritos();
    _getCategoria();
    _thema();

//    _device();

  }
  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);

  }
  _movieSelectorRotate(int index) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Videoscreen(movie: list[index]),
                ),
              );

            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(list[index].url,)
                  ),
                ),
              ),
            ),
          ),


          Container(
            height: 190,
            width: 300,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ListView(
              children: <Widget>[
                Text(
                  list[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Opacity(
                    opacity: 0.8,
                    child:
                    Text(
                      'Episódios: '+list[index].episodes.toString() + '         Status: '+list[index].status,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        list[index].synopse,
                        style: TextStyle(
                            fontSize: 13
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }




  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.02).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Videoscreen(movie: list[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: list[index].title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: NetworkImage(list[index].url),
                        height: 220.0,
                        width: 267.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  list[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _recentAnimes();

    double logoH = 200;
    double logoW =200 ;
    var width = MediaQuery.of(context).size.width;
    if(width<=350){
      logoH = 150;
      logoW = 150;
    }
    if (width > 584) {
      return Scaffold(
        drawer: MenuWidget(page: 'Inicio'),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/animese/name.png',),
                height: logoH,
                width: logoW
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 30.0),
              onPressed: ()
              {
                showSearch(context: context, delegate: DataSearch(recent.reversed.toList()));
              },
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
            ),
          ],
        ),


        body: ListView(
          children: <Widget>[
            Container(
              height: 240.0,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return _movieSelectorRotate(index);
                },
              ),
            ),

            ContentScroll(
              images: listLancamento,
              title: 'Lançamentos',
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),
            ContentScroll(
              images: listCategoria,
              title: 'Sugestões',
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),



            ContentScroll(
              images: listFavoritos,
              title: "Minha lista",
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),
          ],
        ),
      );
    }
    else {
      return Scaffold(
        drawer: MenuWidget(page: 'Inicio'),
//    backgroundColor: HexColor('#212121'),
        appBar: AppBar(
//        backgroundColor: HexColor('000000'),
//        elevation: 10.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/animese/name.png',),
                height: logoH,
                width: logoW
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 30.0),
              onPressed: () 
              {

                showSearch(context: context, delegate: DataSearch(recent.reversed.toList()), );
              },
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
            ),
          ],
        ),


        body: ListView(
          children: <Widget>[
            Container(
              height: 280.0,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return _movieSelector(index);
                },
              ),
            ),

            ContentScrollFavorite(
              images: listLancamento,
              title: 'Lançamentos',
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),
            ContentScrollFavorite(
              images: listCategoria,
              title: 'Sugestões',
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),

            ContentScrollFavorite(
              images: listFavoritos,
              title: "Minha lista",
              imageHeight: 250.0,
              imageWidth: 150.0,
            ),
          ],
        ),
      );
    }
  }
}


class DataSearch extends SearchDelegate<String>{
  List id;

  List recent;
  DataSearch(this.recent);
  ListAnime lisa;
  List searchNome = [];


  saverecent(sugestion) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritos = prefs.getStringList('lista');
    if(favoritos == null){ favoritos = [];}
    if(favoritos.length > 15){favoritos.removeLast();}
    if(favoritos.contains(sugestion) == true){favoritos.remove(sugestion);}

    favoritos.add(sugestion);
    prefs.setStringList('lista', favoritos);
  }

  get(num) async{
    API.getAnimes(id[num], 0).then((response){
      final json = jsonDecode(response.body);
      return ListAnime.fromJson(json);
    });
  }

  save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }




  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      disabledColor: Colors.red,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //SHow some result based on the selection
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when someone searches for something
    final suggestionList = query.isEmpty ?recent :searchNome.where((p) => p.toString().toUpperCase().startsWith(query.toUpperCase())).toList();
    print(searchNome);
    print(query.toUpperCase());

    API.searchAnime(query).then((response){
      Iterable lista = json.decode(response.body);
      List<ListAnime> list = lista.map((model) => ListAnime.fromJson(model)).toList();
      searchNome = list.map((f) => f.title).toList();
      id = list.map((f) => f.sId).toList();
    });

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () async{
            saverecent(suggestionList[index]);
            for(int i = 0; i<searchNome.length; i++){
              if(suggestionList[index].toString() == searchNome[i]){
                API.getAnimes(id[i], 0).then((response){
                  final json = jsonDecode(response.body);
                  lisa = ListAnime.fromJson(json);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Videoscreen(movie: lisa),
                    ),
                  );
                });
              }
            }
          },
          contentPadding: EdgeInsets.only(bottom: 3, top: 3, left: 5),
          title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),

                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                  ),
                ],
              ),
          ),
        ),
      itemCount: suggestionList.length,
    );
  }
}