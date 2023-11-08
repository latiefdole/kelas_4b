// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kelas_4b/models/poli.dart';
import 'package:kelas_4b/ui/poli/poli_form.dart';
import 'package:kelas_4b/ui/poli/poli_item.dart';
import '../../widget/sidebar.dart';

import '../../service/poli_service.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({Key? key}) : super(key: key);
  @override
  _PoliPageState createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          GestureDetector(
            child: const SafeArea(child: Icon(Icons.add)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PoliForm()));
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return const Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PoliItem(poli: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
      // body: ListView(
      //   children: [
      //     PoliItem(poli: Poli(namaPoli: "Poli Anak")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
      //     PoliItem(poli: Poli(namaPoli: "Poli Umum")),
      //     PoliItem(poli: Poli(namaPoli: "Poli THT")),
      //   ],
      // ),
//     );
//   }
// }
