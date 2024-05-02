part of 'sign_in_form_bloc.dart';

sealed class SignInFormEvent {
  const SignInFormEvent();

  const factory SignInFormEvent.emailChanged(String value) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String value) = PasswordChanged;

  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}

class EmailChanged extends SignInFormEvent {
  final String value;

  const EmailChanged(this.value);
}

class PasswordChanged extends SignInFormEvent {
  final String value;

  const PasswordChanged(this.value);
}

class RegisterWithEmailAndPasswordPressed extends SignInFormEvent {
  const RegisterWithEmailAndPasswordPressed();
}

class SignInWithEmailAndPasswordPressed extends SignInFormEvent {
  const SignInWithEmailAndPasswordPressed();
}

class SignInWithGooglePressed extends SignInFormEvent {
  const SignInWithGooglePressed();
}
