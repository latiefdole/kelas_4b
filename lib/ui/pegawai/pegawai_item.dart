import 'package:flutter/material.dart';
import 'package:kelas_4b/models/pegawai.dart';
import 'package:kelas_4b/ui/pegawai/pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: pegawai)));
      },
      child: Card(
        child: ListTile(
          title: Text(pegawai.namaPegawai),
        ),
      ),
    );
  }
}
