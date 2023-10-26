import 'package:flutter/material.dart';
import 'package:kelas_4b/ui/latihan/grid_baris_kolom.dart';
import 'package:kelas_4b/ui/latihan/halaman_utama.dart';
import 'package:kelas_4b/ui/pasien/pasien_page.dart';
import 'package:kelas_4b/ui/pegawai/pegawai_page.dart';
import 'package:kelas_4b/ui/poli/poli_page.dart';
// import 'package:kelas_4b/ui/Profile.dart';
// import 'package:kelas_4b/ui/Settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Klinik App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const Center(
        child: Text(
          'Halaman Utama',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image(image: AssetImage('../img/logo.png')),
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
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GridBarisKolom(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
