import 'package:beproject/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
  );

  User get user => _user;

  void setUser(String user) {
    print(user);
    _user = User.fromJson(user);
    print(_user.toString());
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
