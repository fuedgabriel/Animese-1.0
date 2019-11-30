//import 'dart:html';
import 'package:flutter/material.dart';

//routes
import 'package:flutter_netflix_ui_redesign/routes.dart';


//widget
import 'widgets/content_scroll.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/models/movie_model.dart';

//request
//import '../../request/requestion.dart';
//import '../../request/requestion.dart';


class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

//  var animeList = new List<animes>();

//  getAnimes(){
//    API.getAnimes().then((response){
//      Iterable lista = json.decode(response.body);
//      animeList = lista.map((model) => animes.fromJson(model)).toList();
//
//    });
//  }




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
            builder: (_) => Routes.MovieScreenR(movies, index),
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

      drawer: Routes.Menu('Inicio'),
//    backgroundColor: HexColor('#212121'),
    appBar: AppBar(
//        backgroundColor: HexColor('000000'),
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/images/netflix_logo.png'
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => {
//              API.getAnimes(),
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
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),

          ContentScroll(
            images: myList,
            title: 'Lançamentos',
            imageHeight: 250.0,
            imageWidth: 150.0,


          ),


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
