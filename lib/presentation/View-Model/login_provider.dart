import 'package:bank_mobile/config/Model/user_answer.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  int user = 0;
  

  Future<int> getUser(BuildContext context,String mail, String password) async {
    final response = await UserAnswer().getUserByIdAndPassword(context,mail, password);
    if (response == null) {
      return 0;
    }
    user = response;
    notifyListeners();
    return user;
  }
}

