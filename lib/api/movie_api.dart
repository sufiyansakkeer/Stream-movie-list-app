import 'dart:developer';

import 'package:friend_list_app/api/api_key.dart';

import '../model/api_model.dart';
import 'package:http/http.dart' as http;

class MovieAPI {
  final String omdbUrl =
      "http://www.omdbapi.com/?i=tt3896198&apikey=$apiKey&t=";

  Future<Movie> findMOvie(String string) async {
    var url = Uri.https('$omdbUrl$string');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        return movieFromMap(response.body);
      } else {
        throw Exception("Error occured while fetching movie data");
      }
    } catch (e) {
      log("error occured during fetching");
      return movieFromMap("unknown");
    }
  }
}
