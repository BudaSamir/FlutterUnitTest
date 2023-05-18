import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body);
}

class NetworkServicImp implements NetworkService {
  final dio = Dio();
  @override
  Future<Response> get(String url) async {
    final response = await dio.get(url);
    // if (response.statusCode != 200) throw Exception("Failed To Fetch Data");
    return response.data;
  }

  @override
  Future<Response> post(String url, body) async {
    final response = await dio.post(url, data: body);
    return response.data;
  }
}
