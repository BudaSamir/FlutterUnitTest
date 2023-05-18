// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unit_test_ex2/data/remote_data_source.dart';
import 'package:unit_test_ex2/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}

class PostsRepositoryImp implements PostsRepository {
  final RemoteDataSource _remoteDataSource;
  PostsRepositoryImp(this._remoteDataSource);

  @override
  Future<List<PostModel>> getPosts() async {
    final result = _remoteDataSource.getPosts();
    return result;
  }
}
