import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui_redesign/routes.dart';


class ContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
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
        ),
      ],
    );
  }
}
