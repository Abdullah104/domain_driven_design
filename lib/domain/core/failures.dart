sealed class ValueFailure<T> {
  const ValueFailure();

  const factory ValueFailure.invalidEmail(String failedValue) = InvalidEmail;
  const factory ValueFailure.shortPassword(String failedValue) = ShortPassword;
}

class InvalidEmail<T> extends ValueFailure<T> {
  final String failedValue;

  const InvalidEmail(this.failedValue);
}

class ShortPassword<T> extends ValueFailure<T> {
  final String failedValue;

  const ShortPassword(this.failedValue);
}
