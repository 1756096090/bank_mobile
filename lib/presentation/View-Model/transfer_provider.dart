// ignore_for_file: use_build_context_synchronously
import 'package:bank_mobile/config/Model/bank_account_answer.dart';
import 'package:bank_mobile/config/Model/transfer_answer.dart';
import 'package:flutter/material.dart';

class TransferProvider extends ChangeNotifier {
  Future<dynamic> createTransfer({
    required BuildContext context,
    required int idAccountSender,
    required int idAccountReceiver,
    required double amount,
  }) async {
    final response = await BankAccountAnswer().putTransferAccount(
        context, idAccountSender, idAccountReceiver, amount);

    if (response != null) {
      await TransferAnswer().createTransfer(
        idAccountSender: idAccountSender,
        idAccountReceiver: idAccountReceiver,
        amount: amount,
      );
    }

    return response;
  }
}
