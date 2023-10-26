import 'package:flutter/material.dart';
import 'package:kelas_4b/models/pasien.dart';
import 'package:kelas_4b/ui/pasien/pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRMCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _teleponPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tambah Pasien")),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNoRM(),
                _fieldNamaPasien(),
                _fieldTglLahirPasien(),
                _fieldTeleponPasien(),
                _fieldAlamatPasien(),
                _pembatas(),
                _tombolSimpan()
              ],
            ),
          ),
        ));
  }

  _fieldNoRM() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "NO RM",
          hintText: "Input Nomor RM"),
      controller: _noRMCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Nama Pasien",
          hintText: "Input Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTglLahirPasien() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Tanggal Lahir",
          hintText: "Input Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
    );
  }

  _fieldAlamatPasien() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Alamat Pasien",
          hintText: "Input Alamat Pasien"),
      controller: _alamatPasienCtrl,
    );
  }

  _fieldTeleponPasien() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "No Telp Pasien",
          hintText: "Input Nomor Telepon Pasien"),
      controller: _teleponPasienCtrl,
    );
  }

  _pembatas() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pasien pasien = Pasien(
              namaPasien: _namaPasienCtrl.text,
              nomorRM: _noRMCtrl.text,
              alamat: _alamatPasienCtrl.text,
              nomorTelepon: _teleponPasienCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien)));
        },
        child: const Text("Simpan"));
  }
}
