import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    var data = {"email": email, "password": password};
    final Response response = await ApiClient().post('login', data);
    final responseJson = response.data as Map<String, dynamic>;
    final code = responseJson['code'];

    if (code == 200) {
      final data = responseJson['data'] as Map<String, dynamic>;
      final token = data['token'];
      final user = data['user'] as Map<String, dynamic>;
      final id = user['id'];
      final nama = user['nama'];
      final userEmail = user['email'];

      await UserInfo().setToken(token);
      await UserInfo().setUserID(id.toString());
      await UserInfo().setNama(nama);
      await UserInfo().setUsername(userEmail);
      isLogin = true;
    } else {
      await UserInfo().logout();
      isLogin = false;
    }

    return isLogin;
  }
}
