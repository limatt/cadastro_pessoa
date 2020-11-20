import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_prova/data/dummy_users.dart';
import 'package:flutter_prova/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //MÉTODO PUT ELE SERVE TANTO PARA ALTERAR OU INCLUIR UM ELEMENTO DENTRO DO MAP
  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      //Adicionar elemento no map
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                nome: user.nome,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
