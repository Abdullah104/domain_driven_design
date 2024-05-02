sealed class AuthenticationFailure {
  const AuthenticationFailure();

  const factory AuthenticationFailure.cancelledByUser() = CancelledByUser;

  const factory AuthenticationFailure.serverError() = ServerError;

  const factory AuthenticationFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  const factory AuthenticationFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}

class CancelledByUser extends AuthenticationFailure {
  const CancelledByUser();
}

class ServerError extends AuthenticationFailure {
  const ServerError();
}

class EmailAlreadyInUse extends AuthenticationFailure {
  const EmailAlreadyInUse();
}

class InvalidEmailAndPasswordCombination extends AuthenticationFailure {
  const InvalidEmailAndPasswordCombination();
}
