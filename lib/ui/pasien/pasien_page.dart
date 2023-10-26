import 'package:flutter/material.dart';
import 'package:kelas_4b/models/pasien.dart';
import 'package:kelas_4b/ui/pasien/pasien_form.dart';
import 'package:kelas_4b/ui/pasien/pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          ElevatedButton(
            child: const Text("Tambah Data"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
              pasien: Pasien(
                  namaPasien: "Pasien 1",
                  nomorRM: "Melati1",
                  alamat: "Jakarta Pusat",
                  nomorTelepon: "088888888",
                  tanggalLahir: "14 Oktober 1993")),
          PasienItem(
              pasien: Pasien(
                  namaPasien: "Pasien 1",
                  nomorRM: "Melati2",
                  alamat: "Jakarta Timur",
                  nomorTelepon: "089999999",
                  tanggalLahir: "23 Maret 1992")),
          PasienItem(
              pasien: Pasien(
                  namaPasien: "Pasien 1",
                  nomorRM: "Anggrek21",
                  alamat: "Jakarta Utara",
                  nomorTelepon: "085555555",
                  tanggalLahir: "11 Februari 1996")),
        ],
      ),
    );
  }
}
