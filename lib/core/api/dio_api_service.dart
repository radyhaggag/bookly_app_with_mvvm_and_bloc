import 'package:dio/dio.dart';

import 'api_service.dart';

class DioApiService implements ApiService {
  DioApiService(this.dio);

  final Dio dio;

  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  @override
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
