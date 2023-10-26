import 'package:flutter/material.dart';
import '../../models/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  @override
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _NipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _TeleponPegawaiCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaPegawaiCtrl.text = widget.pegawai.namaPegawai;
      _NipPegawaiCtrl.text = widget.pegawai.nip!;
      _tanggalLahirCtrl.text = widget.pegawai.tanggalLahir;
      _TeleponPegawaiCtrl.text = widget.pegawai.nomorTelepon;
      _emailCtrl.text = widget.pegawai.email;
      _passwordCtrl.text = widget.pegawai.password!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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
      ),
    );
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

          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai)));
        },
        child: const Text("Simpan Perubahan"));
  }
}
