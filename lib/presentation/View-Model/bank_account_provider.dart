import 'package:bank_mobile/config/Model/bank_account_answer.dart';
import 'package:bank_mobile/infrastructure/models/bank_account_model.dart';
import 'package:flutter/material.dart';

class BankAccountProvider extends ChangeNotifier {
  int acccount = 0;
  final int user;
  BankAccountModel? bankAccount; 
  bool _isDisposed = false;

  BankAccountProvider({required this.user}) {
    initialize(); // Llama a la función de inicialización desde el constructor
  }

  Future<void> initialize() async {
    try {
      final BankAccountModel response = await BankAccountAnswer().getAccountByUserId(user);
      if (!_isDisposed) {
        this.bankAccount = response;
        notifyListeners();
      }
    } catch (e) {
      print('Error al obtener la cuenta bancaria: $e');
    }
  }

  @override
  void dispose() {
    _isDisposed = true; 
    super.dispose();
  }
}
