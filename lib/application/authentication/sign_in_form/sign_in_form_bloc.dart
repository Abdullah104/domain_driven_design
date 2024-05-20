import 'package:domain_driven_design/domain/authentication/authentication_facade.dart';
import 'package:domain_driven_design/domain/authentication/authentication_failure.dart';
import 'package:domain_driven_design/domain/authentication/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@lazySingleton
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthenticationFacade _authenticationFacade;

  SignInFormBloc(this._authenticationFacade)
      : super(SignInFormState.initial()) {
    on<EmailChanged>(
      (event, emit) => emit(
        state.copyWith(
          emailAddress: EmailAddress(event.value),
          authenticationFailureOrSuccessOption: none(),
        ),
      ),
    );

    on<PasswordChanged>(
      (event, emit) => emit(
        state.copyWith(
          password: Password(event.value),
          authenticationFailureOrSuccessOption: none(),
        ),
      ),
    );

    on<RegisterWithEmailAndPasswordPressed>(
      (event, emit) => _performActionOnAuthenticationFacadeWithEmailAndPassword(
        _authenticationFacade.registerWithEmailAndPassword,
        emit,
      ),
    );

    on<SignInWithEmailAndPasswordPressed>(
      (event, emit) => _performActionOnAuthenticationFacadeWithEmailAndPassword(
        _authenticationFacade.signInWithEmailAndPassword,
        emit,
      ),
    );

    on<SignInWithGooglePressed>(
      (event, emit) async {
        emit(
          state.copyWith(
            isSubmitting: true,
            authenticationFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await _authenticationFacade.signInWithGoogle();

        emit(
          state.copyWith(
            isSubmitting: false,
            authenticationFailureOrSuccessOption: some(failureOrSuccess),
          ),
        );
      },
    );
  }

  Future<void> _performActionOnAuthenticationFacadeWithEmailAndPassword(
    Future<Either<AuthenticationFailure, Unit>> Function(
      EmailAddress email,
      Password password,
    ) forwardedCall,
    Emitter<SignInFormState> emit,
  ) async {
    Either<AuthenticationFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authenticationFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess =
          await forwardedCall(state.emailAddress, state.password);
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authenticationFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
