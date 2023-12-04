import 'package:bank_mobile/config/helpers/bank_account_answer.dart';
import 'package:bank_mobile/infrastructure/models/bank_account_model.dart';
import 'package:flutter/material.dart';

class BankAccountProvider extends ChangeNotifier {
  int acccount = 0;
  final int user;
  BankAccountModel? bankAccount; 

  BankAccountProvider({required this.user}) {
    _initialize(); // Llama a la función de inicialización desde el constructor
  }

  Future<void> _initialize() async {
    final BankAccountModel response = await BankAccountAnswer().getAccountByUserId(user);
    this.bankAccount = response;
    notifyListeners();
  }
}
