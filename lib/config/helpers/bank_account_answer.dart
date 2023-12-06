import 'dart:ffi';

import 'package:bank_mobile/infrastructure/models/bank_account_model.dart';
import 'package:dio/dio.dart';

class BankAccountAnswer {
  static const String url =
      "https://apibankservice20231127083449.azurewebsites.net/";
  final _dio = Dio();

  Future<BankAccountModel> getAccountByUserId(int id) async {
    final String apiUrl = '$url/api/BankAccount/$id';

    final Response response = await _dio.get(apiUrl);

    final BankAccountModel  accountModel =BankAccountModel.fromJson(response.data);

    return accountModel;
  }
  Future<BankAccountModel> putTransferAccount(int idSender, int idReceive, double amount) async {
    final String apiUrl = '$url/api/BankAccount/$idSender/$idReceive/$amount/';

    final Response response = await _dio.put(apiUrl);

    final BankAccountModel  accountModel =BankAccountModel.fromJson(response.data);

    return accountModel;
  }
}
