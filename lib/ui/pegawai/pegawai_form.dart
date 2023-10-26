import 'package:flutter/material.dart';
import 'package:kelas_4b/models/pegawai.dart';
import 'package:kelas_4b/ui/pegawai/pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _NipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _TeleponPegawaiCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  //bool _obscureText = true;

  //String? _password;

  // Toggles the password show status
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tambah Pegawai")),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNIPPegawai(),
                _fieldNamaPegawai(),
                _fieldTglLahirPegawai(),
                _fieldTeleponPegawai(),
                _fieldEmailPegawai(),
                _fieldPassword(),
                _pembatas(),
                _tombolSimpan()
              ],
            ),
          ),
        ));
  }

  _fieldNIPPegawai() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "NIP Pegawai",
          hintText: "Input NIP Pegawai"),
      controller: _NipPegawaiCtrl,
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Nama Pegawai",
          hintText: "Input Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTglLahirPegawai() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Tanggal Lahir",
          hintText: "Input Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
    );
  }

  _fieldTeleponPegawai() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Nomor Telepon",
          hintText: "Input Nomor Telepon"),
      controller: _TeleponPegawaiCtrl,
    );
  }

  _fieldEmailPegawai() {
    return TextField(
      decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: "Email",
          hintText: "Input Email"),
      controller: _emailCtrl,
    );
  }

  _fieldPassword() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
      obscureText: true,
    );
  }

  _pembatas() {
    return const SizedBox(height: 20);
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pegawai pegawai = Pegawai(
              namaPegawai: _namaPegawaiCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _TeleponPegawaiCtrl.text,
              email: _emailCtrl.text,
              password: _passwordCtrl.text);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(
                        pegawai: pegawai,
                      )));
        },
        child: const Text("Simpan"));
  }
}
