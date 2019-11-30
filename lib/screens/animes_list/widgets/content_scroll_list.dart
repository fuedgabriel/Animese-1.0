import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class ContentScroll extends StatelessWidget {
  final List<String> images;

  ContentScroll({
    this.images,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
//      alignment: Alignment.bottomLeft,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 5.0,
            ),
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: HexColor('#2b2a2a'),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 9.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );

  }
}
