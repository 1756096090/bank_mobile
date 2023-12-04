import 'package:bank_mobile/infrastructure/models/user_model.dart';
import 'package:dio/dio.dart';

class UserAnswer {
  static const String url =
      "https://apibankservice20231127083449.azurewebsites.net/";
  final _dio = Dio();

  Future<dynamic> getUserByIdAndPassword(String mail, String password) async {
  final String apiUrl = '$url/api/User/$mail/$password';

  final Response response = await _dio.get(apiUrl);

  final userModel = UserModel.fromJson(response.data);

  return userModel.idUser;
}

}
