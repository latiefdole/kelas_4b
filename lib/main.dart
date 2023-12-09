import 'package:flutter/material.dart';
import 'widget/halaman_utama.dart';
import '/helpers/user_info.dart';
import '/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();

  runApp(MaterialApp(
    title: "Klinik APP",
    debugShowCheckedModeBanner: false,
    home: token == null ? const Login() : const HalamanUtama(),
  ));
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Widget page = const CircularProgressIndicator();

//   @override
//   void initState() {
//     super.initState();
//     isLogin();
//   }

//   void isLogin() async {
//     var token = await UserInfo().getToken();
//     if (token != null) {
//       setState(() {
//         page = const HalamanUtama();
//       });
//     } else {
//       setState(() {
//         page = const Login();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Toko Kita',
//       debugShowCheckedModeBanner: false,
//       home: page,
//     );
//   }
// }
