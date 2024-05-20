import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:fpdart/fpdart.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) =>
    RegExp(
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
    ).hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidEmail(input));

Either<ValueFailure<String>, String> validatePassword(String input) =>
    input.length >= 6 ? right(input) : left(ValueFailure.shortPassword(input));
