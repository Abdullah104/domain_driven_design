import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/authentication/authentication_facade.dart';
import '../../domain/authentication/authentication_failure.dart';
import '../../domain/authentication/value_objects.dart';

class FirebaseAuthenticationFacade implements AuthenticationFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthenticationFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthenticationFailure, Unit>> registerWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  ) async {
    try {
      await _performAuthenticationOperationWithEmailAndPassword(
        emailAddress,
        password,
        _firebaseAuth.createUserWithEmailAndPassword,
      );

      return right(unit);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'email-already-in-use') {
        return left(const AuthenticationFailure.emailAlreadyInUse());
      }

      return left(const AuthenticationFailure.serverError());
    }
  }

  @override
  Future<Either<AuthenticationFailure, Unit>> signInWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
  ) async {
    try {
      await _performAuthenticationOperationWithEmailAndPassword(
        emailAddress,
        password,
        _firebaseAuth.signInWithEmailAndPassword,
      );

      return right(unit);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'wrong-password' ||
          exception.code == 'user-not-found') {
        return left(
          const AuthenticationFailure.invalidEmailAndPasswordCombination(),
        );
      }

      return left(const AuthenticationFailure.serverError());
    }
  }

  @override
  Future<Either<AuthenticationFailure, Unit>> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return left(
        const AuthenticationFailure.cancelledByUser(),
      );
    }

    final googleAuthentication = await googleUser.authentication;

    final authenticationCredential = GoogleAuthProvider.credential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken,
    );

    return _firebaseAuth
        .signInWithCredential(authenticationCredential)
        .then((_) => right<AuthenticationFailure, Unit>(unit))
        .catchError(
          (_) => left<AuthenticationFailure, Unit>(
            const AuthenticationFailure.serverError(),
          ),
        );
  }

  Future<void> _performAuthenticationOperationWithEmailAndPassword(
    EmailAddress emailAddress,
    Password password,
    Future<void> Function({
      required String email,
      required String password,
    }) call,
  ) async {
    final emailAddressString = emailAddress.getOrCrash();
    final passwordString = password.getOrCrash();

    await call(
      email: emailAddressString,
      password: passwordString,
    );
  }
}