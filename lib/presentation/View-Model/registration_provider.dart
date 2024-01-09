import 'package:bank_mobile/config/Model/user_answer.dart';
import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  Future<dynamic> createUser({
    required String name,
    required String lastName,
    required String mail,
    required String password,
    required String phone,
    required String dni,
  }) async {
    await UserAnswer().createUser(name, mail, password, phone, dni);
  }
}
