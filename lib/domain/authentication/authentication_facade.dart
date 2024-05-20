import 'package:fpdart/fpdart.dart';

import 'authentication_failure.dart';
import 'value_objects.dart';

abstract interface class AuthenticationFacade {
  Future<Either<AuthenticationFailure, Unit>> registerWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  );

  Future<Either<AuthenticationFailure, Unit>> signInWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  );

  Future<Either<AuthenticationFailure, Unit>> signInWithGoogle();
}
