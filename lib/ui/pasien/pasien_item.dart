import 'package:flutter/material.dart';
import 'package:kelas_4b/models/pasien.dart';
import 'package:kelas_4b/ui/pasien/pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: pasien)));
      },
      child: Card(
        child: ListTile(
          title: Text(pasien.namaPasien),
        ),
      ),
    );
  }
}
