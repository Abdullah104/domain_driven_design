import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testFailedValue = 'testFailedValue';

  void testValueFailureFailedValueAssigning<T>(
    ValueFailure<T> Function(String) constructor,
  ) =>
      test(
        'Assignes [failedValue] property to value received from constructor',
        () {
          final failure = constructor(testFailedValue);

          expect(
            switch (failure) {
              InvalidEmail() => failure.failedValue,
              ShortPassword() => failure.failedValue,
            },
            testFailedValue,
          );
        },
      );

  group('[InvalidEmail]', () {
    testValueFailureFailedValueAssigning((value) => InvalidEmail(value));
  });

  group('[ShortPassword]', () {
    testValueFailureFailedValueAssigning((value) => ShortPassword(value));
  });
}
