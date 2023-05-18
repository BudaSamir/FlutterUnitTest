// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:unit_test_ex2/core/services/network_service.dart';
import 'package:unit_test_ex2/models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceImp({required this.networkService});

  @override
  Future<List<PostModel>> getPosts() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await networkService.get(url);
    if (response.statusCode != 200) throw Exception();
    final result = response.data as List;
    final posts = result.map((post) => PostModel.fromMap(post)).toList();

    return posts;
  }
}
