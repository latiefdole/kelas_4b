import 'package:flutter/material.dart';
import 'package:kelas_4b/models/poli.dart';
import 'package:kelas_4b/ui/poli/poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;
  const PoliItem({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
      },
      child: Card(
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
    );
  }
}
