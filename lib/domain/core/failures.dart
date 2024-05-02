sealed class ValueFailure<T> {
  const ValueFailure();
}

class InvalidEmail<T> extends ValueFailure<T> {
  final String failedValue;

  const InvalidEmail(this.failedValue);
}

class ShortPassword<T> extends ValueFailure<T> {
  final String failedValue;

  const ShortPassword(this.failedValue);
}
