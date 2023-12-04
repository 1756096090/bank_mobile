import 'package:bank_mobile/infrastructure/models/transfer_model.dart';
import 'package:dio/dio.dart';

class TransferAnswer{
  static const String url ="https://apibankservice20231127083449.azurewebsites.net/";
  final _dio = Dio();


  
  Future<int> createTransfer({
    required int idAccountSender,
    required int idAccountReceiver,
    required int amount,
  }) async {
    final jsonTransfer = TransferModel(
        idAccountSender: idAccountSender,
        idAccountReceiver: idAccountReceiver,
        amount: amount,
        dateIssue: DateTime.now(),);

    final response = await _dio.post(
      url+'/api/Transferencia'	,
      data: jsonTransfer.toJson(),
    );

    return response.data;
  }
}