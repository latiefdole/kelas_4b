import 'package:flutter/material.dart';
import 'package:kelas_4b/models/poli.dart';
import 'package:kelas_4b/ui/poli/poli_form.dart';
import 'package:kelas_4b/ui/poli/poli_item.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          ElevatedButton(
            child: const Center(child: Text("Tambah Data")),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PoliForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PoliItem(poli: Poli(namaPoli: "Poli Anak")),
          PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
          PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
          PoliItem(poli: Poli(namaPoli: "Poli Umum")),
          PoliItem(poli: Poli(namaPoli: "Poli THT")),
        ],
      ),
    );
  }
}
