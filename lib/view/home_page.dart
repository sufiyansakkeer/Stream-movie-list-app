import 'package:flutter/material.dart';
import 'package:friend_list_app/view/friend_list.dart';
import 'package:friend_list_app/view/movie_search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home "),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FriendList(),
                ),
              );
            },
            child: const Text("Friends list"),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MovieSearchScreen(),
                ),
              );
            },
            child: const Text("OMDB"),
          ),
        ],
      )),
    );
  }
}
