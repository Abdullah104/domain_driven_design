part of 'authentication_bloc.dart';

sealed class AuthenticationState {
  const AuthenticationState();

  const factory AuthenticationState.initial() = Initial;

  const factory AuthenticationState.authenticated() = Authenticated;

  const factory AuthenticationState.unauthenticated() = Unauthenticated;
}

class Initial extends AuthenticationState {
  const Initial();
}

class Authenticated extends AuthenticationState {
  const Authenticated();
}

class Unauthenticated extends AuthenticationState {
  const Unauthenticated();
}
