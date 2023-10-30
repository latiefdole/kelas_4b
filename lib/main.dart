import 'package:flutter/material.dart';
import 'widget/halaman_utama.dart';
import '/helpers/user_info.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik APP",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : HalamanUtama(),
  ));
}
