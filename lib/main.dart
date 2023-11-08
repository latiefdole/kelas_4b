import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widget/halaman_utama.dart';
import '/helpers/user_info.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  if (kDebugMode) {
    print(token);
  }
  runApp(MaterialApp(
    title: "Klinik APP",
    debugShowCheckedModeBanner: false,
    home: token == null ? const Login() : const HalamanUtama(),
  ));
}
