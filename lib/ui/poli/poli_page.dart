import 'package:flutter/material.dart';
import 'package:kelas_4b/models/poli.dart';
import 'package:kelas_4b/ui/poli/poli_form.dart';
import 'package:kelas_4b/ui/poli/poli_item.dart';

import '../../service/poli_service.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          ElevatedButton(
            child: const Center(child: Text("Tambah Data")),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PoliForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PoliItem(poli: snapshot.data[index]);
            },
          );
        },
      ),

      // body: ListView(
      //   children: [
      //     PoliItem(poli: Poli(namaPoli: "Poli Anak")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Umum")),
      //     PoliItem(poli: Poli(namaPoli: "Poli THT")),
      //   ],
      // ),
    );
  }
}
