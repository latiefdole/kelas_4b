import 'package:flutter/material.dart';
import '../../models/pegawai.dart';
import 'pegawai_page.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pegawai Detail")),
      body: Column(
        children: [
          ListTile(
              title: const Text("NIP"),
              subtitle: Text(widget.pegawai.nip ?? "12345",
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Nama Pegawai"),
              subtitle: Text(widget.pegawai.namaPegawai,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Tanggal Lahir"),
              subtitle: Text(widget.pegawai.tanggalLahir,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Nomor Telepon"),
              subtitle: Text(widget.pegawai.nomorTelepon,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Email"),
              subtitle:
                  Text(widget.pegawai.email, style: const TextStyle(fontSize: 20))),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
// tombol ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const PegawaiPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("YA"),
              ),
// tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tidak"),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}
