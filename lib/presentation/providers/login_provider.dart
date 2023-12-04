import 'package:bank_mobile/config/helpers/user_answer.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  int user = 0;
  

  Future<int> getUser(String mail, String password) async {
    final response = await UserAnswer().getUserByIdAndPassword(mail, password);
    user = response;
    notifyListeners();
    return user;
  }
}
