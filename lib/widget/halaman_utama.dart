import 'package:flutter/material.dart';
import '../models/pasien.dart';
import '../models/poli.dart';
import '../service/pasien_service.dart';
import '../service/pegawai_service.dart';
import '../models/pegawai.dart';
import '../service/poli_service.dart';
import '../ui/pasien/pasien_page.dart';
import '../ui/pegawai/pegawai_page.dart';
import '../ui/poli/poli_page.dart';
import 'sidebar.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<Pegawai> totaluser = [];
  List<Pasien> totalpasien = [];
  List<Poli> totalpoli = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final List<Pegawai> fetchedUsers = await PegawaiService().listData();
    final List<Pasien> fetchedPasien = await PasienService().listData();
    final List<Poli> fetchedPoli = await PoliService().listData();
    setState(() {
      totaluser = fetchedUsers;
      totalpasien = fetchedPasien;
      totalpoli = fetchedPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardCard(
            title: 'Total Poli',
            value: totalpoli.length.toString(),
            icon: Icons.local_hospital,
            color: Colors.blue,
          ),
          DashboardCard(
            title: 'Total Pasien',
            value: totalpasien.length.toString(),
            icon: Icons.health_and_safety,
            color: Colors.orange,
          ),
          DashboardCard(
            title: 'Total Pegawai',
            value: totaluser.length.toString(),
            icon: Icons.person,
            color: Colors.green,
          ),
          DashboardCard(
            title: 'Messages',
            value: '10',
            icon: Icons.message,
            color: Colors.red,
          ),
          // Add more DashboardCard widgets as needed
        ],
      ),
      drawer: Sidebar(),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  void navigateToPage(BuildContext context) {
    switch (title) {
      case 'Total Poli':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PoliPage(),
        ));
        break;
      case 'Total Pasien':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PasienPage(),
        ));
        break;
      case 'Total Pegawai':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PegawaiPage(),
        ));
        break;
      // Add more cases for other cards if needed
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(16),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40,
            color: color,
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            value,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
