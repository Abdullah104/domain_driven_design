import 'package:domain_driven_design/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() => Error.safeToString(
        'Encountered a ValueFailure at an unrecoverable point. Terminatin. '
        'Failure was: $valueFailure',
      );
}
