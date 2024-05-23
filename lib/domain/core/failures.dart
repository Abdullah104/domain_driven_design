sealed class ValueFailure<T> {
  const ValueFailure();

  const factory ValueFailure.invalidEmail(T failedValue) = InvalidEmail;
  const factory ValueFailure.shortPassword(T failedValue) = ShortPassword;

  const factory ValueFailure.exceedingLength(T failedValue, int max) =
      ExceedingLength;

  const factory ValueFailure.empty(T failedValue) = Empty;
  const factory ValueFailure.multiLine(T failedValue) = MultiLine;
  const factory ValueFailure.listTooLong(T failedValue, int max) = ListTooLong;
}

class InvalidEmail<T> extends ValueFailure<T> {
  final T failedValue;

  const InvalidEmail(this.failedValue);
}

class ShortPassword<T> extends ValueFailure<T> {
  final T failedValue;

  const ShortPassword(this.failedValue);
}

class ExceedingLength<T> extends ValueFailure<T> {
  final T failedValue;
  final int max;

  const ExceedingLength(this.failedValue, this.max);
}

class Empty<T> extends ValueFailure<T> {
  final T failedValue;

  const Empty(this.failedValue);
}

class MultiLine<T> extends ValueFailure<T> {
  final T failedValue;

  const MultiLine(this.failedValue);
}

class ListTooLong<T> extends ValueFailure<T> {
  final T failedValue;
  final int max;

  const ListTooLong(this.failedValue, this.max);
}
