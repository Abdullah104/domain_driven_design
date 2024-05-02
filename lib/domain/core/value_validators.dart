import 'package:fpdart/fpdart.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) =>
    RegExp(
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
    ).hasMatch(input)
        ? right(input)
        : left(InvalidEmail(input));

Either<ValueFailure<String>, String> validatePassword(String input) =>
    input.length >= 6 ? right(input) : left(ShortPassword(input));
