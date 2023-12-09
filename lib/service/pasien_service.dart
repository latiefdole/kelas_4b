import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../helpers/api_client.dart';
import '../models/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {
    final Response response = await ApiClient().get('pasien');
    final List data = response.data['data'] as List;
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;
  }

  Future<Pasien> simpan(Pasien pasien) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().post('pasien', data);
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().put('pasien/$id', data);
    if (kDebugMode) {
      print(response);
    }
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/$id');
    Pasien result = Pasien.fromJson(response.data['data']);
    return result;
  }

  Future<bool> hapus(Pasien pasien) async {
    final Response response = await ApiClient().delete('pasien/${pasien.id}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
