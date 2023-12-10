import 'package:bank_mobile/config/helpers/bank_account_answer.dart';
import 'package:bank_mobile/config/helpers/transfer_answer.dart';
import 'package:flutter/material.dart';

class TransferProvider extends ChangeNotifier {
  //Todo: Transfer
  Future<dynamic> createTransfer({
    required int idAccountSender,
    required int idAccountReceiver,
    required double amount,
  }) async {
    final response = await TransferAnswer().createTransfer(
      idAccountSender: idAccountSender,
      idAccountReceiver: idAccountReceiver,
      amount: amount,
    );
    final response2 = await BankAccountAnswer()
        .putTransferAccount(idAccountSender, idAccountReceiver, amount);

    return response2;
  }
}
