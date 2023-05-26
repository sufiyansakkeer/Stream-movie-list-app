import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:friend_list_app/model/api_model.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(movie.poster),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(movie.poster),
              Text(
                movie.title,
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
              Text(movie.imdbRating),
              Text(movie.language),
            ],
          ),
          const SingleChildScrollView(
            child: Column(),
          )
        ],
      ),
    );
  }
}
