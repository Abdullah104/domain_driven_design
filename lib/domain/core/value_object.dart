import 'package:domain_driven_design/domain/core/errors.dart';
import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObject();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value{value=$value}';

  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() => value.fold(
        (failure) => throw UnexpectedValueError(failure),
        identity,
      );
}
