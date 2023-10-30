import 'package:flutter/material.dart';
import 'package:kelas_4b/ui/Login.dart';
import 'package:kelas_4b/widget/halaman_utama.dart';
import 'package:kelas_4b/ui/pasien/pasien_page.dart';
import 'package:kelas_4b/ui/pegawai/pegawai_page.dart';
import 'package:kelas_4b/ui/poli/poli_page.dart';

import '../helpers/user_info.dart';

class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);
  final UserInfo userInfo = UserInfo();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child:
          // ),
          const UserAccountsDrawerHeader(
              // currentAccountPicture: Image(image: AssetImage('../../img/logo.png')),
              accountName: Text("Admin"),
              accountEmail: Text("admin@admin.com")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HalamanUtama()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Pegawai'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PegawaiPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Pasien'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PasienPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text('Poli'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PoliPage(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () async {
              await userInfo.logout(); // Call the logout function
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
