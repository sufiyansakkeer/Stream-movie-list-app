import 'dart:async';
import 'dart:developer';

import 'package:friend_list_app/bloc/base_bloc.dart';
import 'package:friend_list_app/model/api_model.dart';
import 'package:friend_list_app/repository/movie_repo.dart';

class MovieSearchBloc extends BaseBloc {
  final movieRepo = MovieRepo();
  final StreamController<Movie> _movieController = StreamController<Movie>();
  final StreamController<String> _queryController = StreamController<String>();
  Stream<Movie> get movieStream => _movieController.stream;
  //query controller function getter
  Function(String) get query => _queryController.sink.add;

  //* when ever queryController sink a value this constructor will trigger,
  //* as long as there is a object or instance for this class
  MovieSearchBloc() {
    _queryController.stream.listen(fetchMovie);
  }
  void fetchMovie(String name) async {
    var movie = await movieRepo.findMovieByName(name);
    log(movie.title, name: "movie name");
    _movieController.sink.add(movie);
  }

  @override
  void dispose() {
    _movieController.close();
    _queryController.close();
  }
}
