part of 'sign_in_form_bloc.dart';

class SignInFormState {
  final EmailAddress emailAddress;
  final Password password;
  final bool isSubmitting;
  final bool showErrorMessages;

  final Option<Either<AuthenticationFailure, Unit>>
      authenticationFailureOrSuccessOption;

  SignInFormState(
      {required this.emailAddress,
      required this.password,
      required this.isSubmitting,
      required this.showErrorMessages,
      required this.authenticationFailureOrSuccessOption});

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessages: false,
        authenticationFailureOrSuccessOption: none(),
      );

  SignInFormState copyWith({
    EmailAddress? emailAddress,
    Password? password,
    bool? isSubmitting,
    bool? showErrorMessages,
    Option<Either<AuthenticationFailure, Unit>>?
        authenticationFailureOrSuccessOption,
  }) =>
      SignInFormState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        showErrorMessages: showErrorMessages ?? this.showErrorMessages,
        authenticationFailureOrSuccessOption:
            authenticationFailureOrSuccessOption ??
                this.authenticationFailureOrSuccessOption,
      );
}
