import 'package:domain_driven_design/domain/authentication/authentication_failure.dart';
import 'package:domain_driven_design/domain/authentication/value_objects.dart';
import 'package:fpdart/fpdart.dart';

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
