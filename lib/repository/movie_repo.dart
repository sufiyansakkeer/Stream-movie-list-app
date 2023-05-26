import 'package:friend_list_app/api/movie_api.dart';
import 'package:friend_list_app/model/api_model.dart';

class MovieRepo {
  final MovieAPI movieAPI = MovieAPI();
  Future<Movie> findMovieByName(String string) => movieAPI.findMOvie(string);
}
