import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_ex2/data/remote_data_source.dart';
import 'package:unit_test_ex2/models/post_model.dart';
import 'package:unit_test_ex2/repository/posts_repository.dart';

import 'posts_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late PostsRepository postsRepository;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    postsRepository = PostsRepositoryImp(remoteDataSource);
  });

  test("GetPosts Should return a list of Posts Without any Exceptions",
      () async {
    // Arrange
    final posts = List.generate(
        5,
        (index) => PostModel(
            userId: index,
            id: index,
            title: "title $index",
            subTitle: "subTitle $index"));
    // remoteDataSource.getPosts() will Return List<model>
    when(remoteDataSource.getPosts()).thenAnswer((_) => Future.value(posts));

    //Act
    final result = await postsRepository.getPosts();

    // assert
    expect(result, posts);
  });
}
