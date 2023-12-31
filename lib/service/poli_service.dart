import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../helpers/api_client.dart';
import '../models/poli.dart';

class PoliService {
  Future<List<Poli>> listData() async {
    final Response response = await ApiClient().get('poli');
    final List data = response.data['data'] as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  Future<Poli> simpan(Poli poli) async {
    var data = poli.toJson();
    final Response response = await ApiClient().post('poli', data);
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<Poli> ubah(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await ApiClient().put('poli/$id', data);
    if (kDebugMode) {
      print(response);
    }
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/$id');
    Poli result = Poli.fromJson(response.data['data']);
    return result;
  }

  Future<bool> hapus(Poli poli) async {
    final Response response = await ApiClient().delete('poli/${poli.id}');
    //Poli result = Poli.fromJson(response.data['data']);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
