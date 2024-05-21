import 'package:domain_driven_design/domain/authentication/authentication_facade.dart';
import 'package:domain_driven_design/domain/authentication/authentication_failure.dart';
import 'package:domain_driven_design/domain/authentication/user.dart';
import 'package:domain_driven_design/domain/authentication/value_objects.dart';
import 'package:domain_driven_design/infrastructure/authentication/firebase_user_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationFacade)
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

  @override
  Future<Option<User>> getSignedInUser() => Future.value(
        optionOf(_firebaseAuth.currentUser?.toDomain()),
      );

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

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
