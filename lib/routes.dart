import 'package:flutter_netflix_ui_redesign/screens/animes_list/animes_screen.dart';

import 'widgets/menu.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'screens/suporte_anime/suporteAnime.dart';
class Routes {
  static Menu(String pagina){
    return new MenuWidget(page: pagina);
  }

  static MovieScreenR(movies,int index){

    return new MovieScreen(movie: movies[index]);

  }
  static SuporteAnimeScreenR(movies){
    return new suporteAnime(movieA: movies);

  }

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}