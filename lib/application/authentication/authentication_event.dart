part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();

  const factory AuthenticationEvent.authenticationCheckRequested() =
      AuthenticationCheckRequested;

  const factory AuthenticationEvent.signedOut() = SignedOut;
}

class AuthenticationCheckRequested extends AuthenticationEvent {
  const AuthenticationCheckRequested();
}

class SignedOut extends AuthenticationEvent {
  const SignedOut();
}
