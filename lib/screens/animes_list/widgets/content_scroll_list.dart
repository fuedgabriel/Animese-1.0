import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/request/Animes.dart';
import '../../video/movie_screen.dart';


class ContentScroll extends StatelessWidget {
  final List<ListAnime> images;

  ContentScroll({
    this.images,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 551,
      alignment: Alignment.bottomLeft,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),

              child: Row(children: <Widget>[

                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(images[index].url)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Videoscreen(movie: images[index]),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        images[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.symmetric(horizontal: 3.0)),
                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(images[index+1].url)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Videoscreen(movie: images[index+1]),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        images[index+1].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.symmetric(horizontal: 3.0)),
                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(images[index+2].url)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Videoscreen(movie: images[index+2]),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        images[index+2].url,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),
              ],
              )
          );
        },
      ),
    );

  }
}
