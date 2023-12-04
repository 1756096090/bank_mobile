
import 'package:bank_mobile/config/helpers/transfer_answer.dart';
import 'package:flutter/material.dart';

class TransferProvider extends ChangeNotifier {
  //Todo: Transfer
  Future<int> createTransfer({
    required int idAccountSender,
    required int idAccountReceiver,
    required int amount,
  }) async {
    final response = await TransferAnswer().createTransfer(
      idAccountSender: idAccountSender,
      idAccountReceiver: idAccountReceiver,
      amount: amount,
    );
    return response;
  }
}
