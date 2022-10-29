import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/usecase/usecase.dart';

void main() {
  test(
    'make sure that the props of NoParams is []',
    () async {
      // assert
      expect(NoParams().props, []);
    },
  );
}