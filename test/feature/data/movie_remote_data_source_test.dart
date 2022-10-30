import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:movie_app/core/config.dart';
import 'package:movie_app/features/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);
  final MovieRemoteDataSource movieRemoteDataSource =
      MovieRemoteDataSourceImpl(dio: dio);

  group('getTopMovies', () {
    final TopRatedMovieResponseModel topRatedMovieResponseModel =
        TopRatedMovieResponseModel.fromJson(
      fixture('top_rated_movie_response_model.json'),
    );

    void setUpMockDioSuccess() async {
      final responsePayload =
          json.decode(fixture('top_rated_movie_response_model.json'));

      dioAdapter.onGet(
        Config.topRatedMovieURL,
        (server) => server.reply(
          200,
          responsePayload,
          // Reply would wait for one-sec before returning data.
          delay: const Duration(seconds: 1),
        ),
        queryParameters: {
          'api_key': Config.apiKey,
          'language': 'en-US',
          'page': 1
        },
      );
    }
    
    test(
      'make sure to return the TopHeadlinesNewsResponseModel object when the '
      'response code is successful from the endpoint',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await movieRemoteDataSource.getTopRatedMovieDetails('1');

        // assert
        expect(result, topRatedMovieResponseModel);
      },
    );

    test(
      'make sure to receive DioError when the response code fails from the endpoint',
      () async {
        // arrange
        dioAdapter.onGet(
            Config.topRatedMovieURL, (server) => server.reply(400, null));

        // act
        final call = movieRemoteDataSource.getTopRatedMovieDetails('1');

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioError>()));
      },
    );
  });
}
