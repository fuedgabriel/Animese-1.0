import 'widgets/menu.dart';
import 'package:flutter_netflix_ui_redesign/screens/movie_screen.dart';



class Routes {
  static Menu(String pagina){
    return new MenuWidget(page: pagina);
  }

  static MovieScreenR(movies,int index){

    return new MovieScreen(movie: movies[index]);

  }
}
