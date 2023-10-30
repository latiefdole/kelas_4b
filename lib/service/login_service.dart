import 'package:dio/dio.dart';

import '../helpers/api_client.dart';
import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    var data = {"email": email, "password": password};
    final Response response = await ApiClient().post('login', data);
    print("Login API Response: ${response.data}");

    if (response.statusCode == 200) {
      await UserInfo().setToken("${response.data["token"]}");
      await UserInfo().setUserID("${response.data["id"]}");
      await UserInfo().setUsername("${response.data["email"]}");
      isLogin = true;
    }
    // if (username == 'admin' && password == 'admin') {
    //   await UserInfo().setToken("admin");
    //   await UserInfo().setUserID("1");
    //   await UserInfo().setUsername("admin");
    //   isLogin = true;
    // }
    return isLogin;
  }
}
