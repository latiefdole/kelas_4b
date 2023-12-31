// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  //baseUrl: 'http://192.168.164.47/api-klinik/public/',
  baseUrl: 'http://172.16.2.23/api-klinik/public/',
  //baseUrl: 'http://10.0.2.2/api-klinik/public/',
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
));

class ApiClient {
  Future<Response> get(String path) async {
    try {
      final response = await dio.get(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, Map data) async {
    try {
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
