import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/errors/failure.dart';

void main() {
  const tErrorMessage = 'test error message';

  group('Server Failure', () {
    test('make sure value is equal to error message', (() async {
      //assert
      expect(ServerFailure(tErrorMessage).props, [tErrorMessage]);
    }));

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(ServerFailure(tErrorMessage).toString(),
            'ServerFailure{errorMessage: $tErrorMessage}');
      },
    );
  });

  group('CacheFailure', () {
    test(
      'make sure the props value is [errorMessage]',
      () async {
        // arrange
        expect(CacheFailure(tErrorMessage).props, [tErrorMessage]);
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(CacheFailure(tErrorMessage).toString(), 'CacheFailure{errorMessage: $tErrorMessage}');
      },
    );
  });

  group('ConnectionFailure', () {
    test(
      'make sure the props value is [errorMessage]',
      () async {
        // assert
        expect(ConnectionFailure().props, [messageConnectionFailure]);
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(ConnectionFailure().toString(), 'ConnectionFailure{errorMessage: $messageConnectionFailure}');
      },
    );
  });
}
