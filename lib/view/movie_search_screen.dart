import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_list_app/bloc/movie_search_bloc.dart';
import 'package:friend_list_app/model/api_model.dart';
import 'package:friend_list_app/view/widgets/movie_detail.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final MovieSearchBloc movieSearchBloc = MovieSearchBloc();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    movieSearchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onSubmitted: movieSearchBloc.query,
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColorLight,
                  child: StreamBuilder<Movie>(
                    stream: movieSearchBloc.movieStream,
                    // initialData: initialData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Container(
                      //     child: Center(
                      //       child: CircularProgressIndicator(),
                      //     ),
                      //   );
                      // } else
                      // log()
                      log(snapshot.data.toString(), name: "snapshot data 2");
                      if (snapshot.hasData) {
                        log(snapshot.data.toString(), name: "snapshot data");
                        return MovieDetails(movie: snapshot.data);
                      } else {
                        return Container(
                          child: const Center(child: Text("No movie found")),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
