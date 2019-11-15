//import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/models/movie_model.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie_screen.dart';
import 'package:flutter_netflix_ui_redesign/widgets/content_scroll.dart';
import '../widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Title = '';
  String url = 'http://127.0.0.1:444/api/anime/';
  getdata() async{
    var res = await http.get(url);
    var resBody = jsonDecode(res.body);
    Title = resBody['Title'];
    setState(() {
      print("Success");
    });
  }


  PageController _pageController;

  @override
  void initState() {
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
            builder: (_) => MovieScreen(movie: movies[index]),
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
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
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
                  movies[index].title.toUpperCase(),
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

      drawer: Drawer(
        child: Column(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountEmail: Text("souloiramesmo@hotmail.com"),
              accountName: Text("Loira"),

              currentAccountPicture: CircleAvatar(child: Text("oi"),),


              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () =>{
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                              title: Text("Adicionar uma nova conta..."));})},
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),

            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
            ),
            ListTile(
              leading: Icon(Icons.pageview),
              title: Text('Lista'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Categorias'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              trailing: Chip(label: Text("11", style: TextStyle(
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.blue[100],
              ),
              )
              ),
            ),
            Divider(),
            Expanded(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.report_problem),
                title: Text("Report"),
              ),
            ),
            ),
            Expanded(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),

            ),
            ),

          ],
        ),



      ),
    backgroundColor: HexColor('#212121'),
    appBar: AppBar(
        backgroundColor: HexColor('000000'),
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/images/netflix_logo.png'
          ),
        ),
//        leading: IconButton(
//          padding: EdgeInsets.only(left: 30.0),
//          onPressed: () => print('Menu'),
//          icon: Icon(Icons.menu),
//          iconSize: 30.0,
//          color: Colors.green,
//    ),


        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
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
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),

          //SizedBox(height: 20.0),

          ContentScroll(
            images: myList,
            title: 'Lançamentos',
            imageHeight: 250.0,
            imageWidth: 150.0,


          ),
          //SizedBox(height: 10.0),
          new RaisedButton(
              onPressed: ()=> {
                getdata(),},
            child: new Text("Get info"),
          ),
          new Text("Name : $Title",style: TextStyle(fontSize: 22.0),),

          ContentScroll(
            images: popular,
            title: "Minha lista",
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}
