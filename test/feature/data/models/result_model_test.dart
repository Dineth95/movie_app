import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/data/models/result_model.dart';

void main() {
  final ResultModel tResultModel = ResultModel((data) => data..adult = false);

  test('make sure the output of the toString function', () {
    expect(
        tResultModel.toString(),
        'ResultModel {\n'
        '  adult=false,\n'
        '}');
  });

  group('fromJson', () {
    test(
      'make sure the fromJson function returns a valid model object when reading valid JSON',
      () async {
        // act
        final ResultModel result = ResultModel.fromJson(json.encode({
          "adult": false,
        }));

        // assert
        expect(result, tResultModel);
      },
    );
  });

  group('toJson', () {
    test(
      'make sure the fromJson function returns a valid model object when reading valid JSON',
      () async {
        // act
        final result = {"adult": false};

        // assert
        expect(result, jsonDecode(tResultModel.toJson()));
      },
    );
  });
}
