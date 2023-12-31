import 'package:flutter/material.dart';
import '../../models/poli.dart';
import '../../widget/sidebar.dart';
import '../../service/poli_service.dart';
import 'poli_page.dart';
import 'poli_update_form.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  Stream<Poli> getData() async* {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Poli Detail")),
      drawer: Sidebar(),
      body: StreamBuilder(
        stream: getData(),
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
            return const Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Nama Poli : ${snapshot.data.namaPoli}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),

      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const SizedBox(height: 20),
      //     Text("Nama Poli : ${widget.poli.namaPoli}",
      //         style: const TextStyle(fontSize: 20)),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         _tombolUbah(),
      //         _tombolHapus(),
      //       ],
      //     )
      //   ],
      // ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PoliUpdateForm(poli: snapshot.data)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"),
      ),
    );
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              // tombol ya
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await PoliService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PoliPage()));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("YA"),
                      )),
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

//    _tombolHapus() {
//     return ElevatedButton(
//         onPressed: () async {
//           AlertDialog alertDialog = AlertDialog(
//             content: const Text("Yakin ingin menghapus data ini?"),
//             actions: [
//               // tombol ya
//               StreamBuilder(
//                 stream: getData(),
//                 builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context)
//                         .pop(); // Close the confirmation dialog
//                     _hapusData(snapshot.data);
//                     // Call the _hapusData function
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PoliPage(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("YA"),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: const Text("Tidak"),
//               )
//             ],
//           );
//           showDialog(context: context, builder: (context) => alertDialog);
//         },
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//         child: const Text("Hapus"));
//   }

// // Function to handle data deletion and navigation
//   _hapusData(data) async {
//     await PoliService().hapus(data);
//     await Future.delayed(Duration.zero);
//     if (!context.mounted) return;
//     Navigator.of(context).pop(); // Close the confirmation dialog
//   }
}
