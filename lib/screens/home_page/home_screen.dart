import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Usuario.dart';

//routes
import 'package:flutter_netflix_ui_redesign/routes.dart';


//widget
import '../../screens/video/movie_screen.dart';
import 'widgets/content_scroll.dart';

//request
//import '../../request/request.dart';
import '../../request/request.dart';
import '../../request/Animes.dart';


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
  var user = new List<User>();
  String theme;
  final itemAppTheme = AppTheme.values;

  _getAnime(){
    API.getAnimes().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
      });
    });
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


  _HomeScreenState(){
    _getAnime();
    _thema();
  }
  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);

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
    return Scaffold(
      drawer: Routes.menu('Inicio'),
//    backgroundColor: HexColor('#212121'),
      appBar: AppBar(
//        backgroundColor: HexColor('000000'),
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/animese/name.png',),
          fit: BoxFit.cover,

        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => {
              showSearch(context: context, delegate: DataSearch())
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

          ContentScroll(
            images: list,
            title: 'Lançamentos',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),

          ContentScroll(
            images: list,
            title: "Minha lista",
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<StreamBuilder>{
  var list = new List<ListAnime>();
  var ado = new List<ListAnime>();


  _getAnime(){
    API.getAnimes().then((response){
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => ListAnime.fromJson(model)).toList();
        ado = list.map((model) => ado.add(model)).toList();
    });
  }



  List cities = [


  ];
  final recentCities = [
    "canada",
    "belem",
    "vaca",
    "salve"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    _getAnime();
    for(int i = 0; i == ado.length.toInt(); i++){
//      cities = cities + ado[i].title;
    }
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Card(
      color: Colors.red,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ?ado.toList()
        :ado.toList();

    return ListView.builder(itemBuilder: (context, index)=>ListTile(
      onTap: (){
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(
        text: TextSpan(
          text: suggestionList[index].title.substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
          ),
          children: [TextSpan(
            text: suggestionList[index].title.substring(query.length),
            style: TextStyle(color: Colors.grey
            )
          )
          ]
        ),
      )
    ),
      itemCount: suggestionList.length,
    );
  }

}
