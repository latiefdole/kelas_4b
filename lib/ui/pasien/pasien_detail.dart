import 'package:flutter/material.dart';
import '../../models/pasien.dart';
import 'pasien_page.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pasien Detail")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          ListTile(
              title: const Text("Nomor RM"),
              subtitle: Text(widget.pasien.nomorRM,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Nama Pasien"),
              subtitle: Text(widget.pasien.namaPasien,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Tanggal Lahir"),
              subtitle: Text(widget.pasien.tanggalLahir,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Nomor Telepon"),
              subtitle: Text(widget.pasien.nomorTelepon,
                  style: const TextStyle(fontSize: 20))),
          ListTile(
              title: const Text("Alamat"),
              subtitle: Text(widget.pasien.alamat,
                  style: const TextStyle(fontSize: 20))),
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
                  builder: (context) =>
                      PasienUpdateForm(pasien: widget.pasien)));
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
                      MaterialPageRoute(builder: (context) => const PasienPage()));
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
