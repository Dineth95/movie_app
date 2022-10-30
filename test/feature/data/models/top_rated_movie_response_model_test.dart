import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/data/models/top_rated_movie_response_model.dart';

void main() {
  final TopRatedMovieResponseModel tTopRatedMovieResponseModel =
      TopRatedMovieResponseModel((data) => data
        ..page = 1
        ..results = null
        ..totalPages = 1
        ..totalResults = 1);

  test('make sure the output of the toString function', () {
    expect(
        tTopRatedMovieResponseModel.toString(),
        'TopRatedMovieResponseModel {\n'
        '  page=1,\n'
        '  totalPages=1,\n'
        '  totalResults=1,\n'
        '}');
  });

  group('fromJson', () {
    test(
      'make sure the fromJson function returns a valid model object when reading valid JSON',
      () async {
        // act
        final TopRatedMovieResponseModel result =
            TopRatedMovieResponseModel.fromJson(json.encode({
          "page": 1,
          "results": null,
          "total_pages": 1,
          "total_results": 1
        }));

        // assert
        expect(result, tTopRatedMovieResponseModel);
      },
    );
  });

  group('toJson', () {
    test(
      'make sure the fromJson function returns a valid model object when reading valid JSON',
      () async {
        // act
        final result = {"page": 1, "total_pages": 1, "total_results": 1};

        // assert
        expect(result, jsonDecode(tTopRatedMovieResponseModel.toJson()));
      },
    );
  });
}
