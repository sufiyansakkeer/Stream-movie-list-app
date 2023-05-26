import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:friend_list_app/api/api_key.dart';

import '../model/api_model.dart';
// import 'package:http/http.dart' as http;

class MovieAPI {
  final Dio dio = Dio();
  final String omdbUrl =
      "http://www.omdbapi.com/?i=tt3896198&apikey=$apiKey&t=";

  Future<Movie> findMOvie(String string) async {
    // var url = Uri.http('$omdbUrl$string');
    Response response = await dio.get('$omdbUrl$string');
    log(response.statusCode.toString(), name: "status code");
    try {
      if (response.statusCode == 200) {
        log(response.data.toString(), name: "response body");
        final Map<String, dynamic> json = response.data;
        log(Movie.fromMap(json).toString(), name: "return json");
        return Movie.fromMap(json);
      } else {
        throw Exception("Error occured while fetching movie data");
      }
    } on DioError catch (e) {
      log(e.toString());
      return movieFromMap("unknown");
    }
  }
}
