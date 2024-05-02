import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../domain/authentication/authentication_facade_interface.dart';
import '../../../domain/authentication/authentication_failure.dart';
import '../../../domain/authentication/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthenticationFacadeInterface _authenticationFacade;

  SignInFormBloc(this._authenticationFacade) : super(SignInFormState.initial());
}
