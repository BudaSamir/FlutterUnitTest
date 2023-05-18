import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_ex2/core/services/network_service.dart';
import 'package:unit_test_ex2/data/remote_data_source.dart';
import 'package:unit_test_ex2/models/post_model.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late RemoteDataSource remoteDataSource;
  late NetworkService networkService;
  late String url;
  setUp(() {
    networkService = MockNetworkService();
    remoteDataSource = RemoteDataSourceImp(networkService: networkService);
    url = "https://jsonplaceholder.typicode.com/posts";
  });
  // Right Test
  test(
    "GetPosts Should Return List of Posts without any Exeption",
    () async {
      // Arrange

      // expact Result
      final posts = List.generate(
          5,
          (index) => PostModel(
              userId: index,
              id: index,
              title: 'title $index',
              subTitle: "subTitle $index")); // mock Api Json Data

      // THe Real Response After decode it will be as Map<String,dynamic>
      // convert List<Model> To List<Map> to Use it in the mockResponse
      final postsMap = posts
          .map((post) => post.toMap())
          .toList(); // This's The body of response (Data)

      // Test On The Mock Method
      // When The Get Method in The NetworkService (Mock) send Request To The url
      when(networkService.get(url)).thenAnswer(
        // networkService.get(url) Will return Response
        // The Answer Will Be The Response (Request Then Response)
        (_) => Future.value(
          // Create The Response That will Return Form The Request
          Response(
            requestOptions: RequestOptions(path: url),
            data: postsMap,
            statusCode: 200,
          ),
        ),
      );
      // Act

      final result =
          await remoteDataSource.getPosts(); // Test on The Real Method

      // Assert
      expect(result, posts);
    },
  );

  test("GetPosts Should Throw an Exception if The Status Code is not 200",
      () async {
    // arrange
    final expectedResult = throwsA(isA<Exception>());
    when(networkService.get(url)).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions: RequestOptions(path: url),
          statusCode: 404,
        ),
      ),
    );

    // act

    result() async => await remoteDataSource.getPosts();

    // assert
    expect(result, expectedResult);
  });
}
