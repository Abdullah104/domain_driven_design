import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kt_dart/kt.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) =>
    RegExp(
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
    ).hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidEmail(input));

Either<ValueFailure<String>, String> validatePassword(String input) =>
    input.length >= 6 ? right(input) : left(ValueFailure.shortPassword(input));

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) =>
    input.length <= maxLength
        ? right(input)
        : left(ValueFailure.exceedingLength(input, maxLength));

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) =>
    input.isNotEmpty ? right(input) : left(ValueFailure.empty(input));

Either<ValueFailure<String>, String> validateSingleLine(String input) =>
    input.contains('\n') ? left(ValueFailure.multiLine(input)) : right(input);

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) =>
    input.size <= maxLength
        ? right(input)
        : left(ValueFailure.listTooLong(input, maxLength));
