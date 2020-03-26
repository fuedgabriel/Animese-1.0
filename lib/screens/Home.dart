import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://imperiumconcursos.com.br/wordpress/wp-content/uploads/2019/08/IMG-20190812-WA0019.jpg',
  'https://imperiumconcursos.com.br/wordpress/wp-content/uploads/2018/12/pre-tecnico.png',
  'https://imperiumconcursos.com.br/wordpress/wp-content/uploads/2019/08/IMG-20190812-WA0019.jpg',
  'https://imperiumconcursos.com.br/wordpress/wp-content/uploads/2018/12/pre-vestibular.png',
  'https://scontent-gig2-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/89483147_793582837801268_3414688847720346315_n.jpg?_nc_ht=scontent-gig2-1.cdninstagram.com&_nc_cat=108&_nc_ohc=RB-14wAI-gEAX9XDl3m&oh=574360cb20cde1f65234d25d0537b5a8&oe=5E9EC260',
  'https://scontent-gig2-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/88371420_849778698872236_5240612077043104357_n.jpg?_nc_ht=scontent-gig2-1.cdninstagram.com&_nc_cat=104&_nc_ohc=u0-VdEHup3YAX-q6zAu&oh=9db150ba37085d47c08717beb6bd1cdf&oe=5E9E76C3'
];
void main() => runApp(Home());

final Widget placeholder = Container(color: Colors.grey);
final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.scaleDown, width: 500.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final CarouselSlider touchDetectionDemo = CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      items: imgList.map(
            (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList()
    );
    return Scaffold(
      drawer: MenuWidget(page: 'Home',),
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Column(children: [
                touchDetectionDemo,
              ])),

        ],
      ),
    );
  }
}
