import 'dart:async';

import 'package:friend_list_app/bloc/base_bloc.dart';

class FriendsBloc extends BaseBloc {
  final List<String> _friends = [];

  final _friendsController = StreamController<List<String>>();
  Stream<List<String>> get friendsStream => _friendsController.stream;
  List<String> get friendsList => _friends;
  @override
  void dispose() {
    _friendsController.close();
  }

  void streamAddingFunction(value) {
    _friends.add(value);
    _friendsController.sink.add(_friends);
  }
}
