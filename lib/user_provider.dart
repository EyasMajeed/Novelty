import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late String _email;
  late String _role;

  String get email => _email;
  String get role => _role;

  // set email (String newEmail) {
  //   _email = newEmail;
  //   notifyListeners();
  // }

}