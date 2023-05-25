import 'package:flutter/material.dart';
import 'package:friend_list_app/bloc/friends_bloc.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final friendsBloc = FriendsBloc();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Friend List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<String>>(
                stream: friendsBloc.friendsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index]),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: friendsBloc.friendsList.length);
                  } else {
                    return Container();
                  }
                }),
          ),
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onSubmitted: (value) {
              friendsBloc.streamAddingFunction(value);
              _textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
