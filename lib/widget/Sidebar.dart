import 'package:flutter/material.dart';
import 'package:kelas_4b/ui/login.dart';
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
          UserAccountsDrawerHeader(
            accountName: FutureBuilder<String>(
              future: UserInfo().getNama(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...'); // Handle loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Handle error
                } else {
                  final namaUser = snapshot.data;
                  return Text("$namaUser");
                }
              },
            ),
            accountEmail: FutureBuilder<String>(
              future: UserInfo().getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...'); // Handle loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Handle error
                } else {
                  final userEmail = snapshot.data;
                  return Text("$userEmail");
                }
              },
            ),
          ),

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
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Keluar"),
            onTap: () async {
              await userInfo.logout();
              await Future.delayed(Duration.zero);
              if (!context.mounted) return;
              // Call the logout function
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Login()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
