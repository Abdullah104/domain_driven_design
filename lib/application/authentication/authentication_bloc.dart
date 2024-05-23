import 'package:domain_driven_design/domain/authentication/authentication_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationFacade _authenticationFacade;

  AuthenticationBloc(this._authenticationFacade)
      : super(const AuthenticationState.initial()) {
    on<AuthenticationCheckRequested>(
      (event, emit) async {
        final userOption = await _authenticationFacade.getSignedInUser();

        emit(
          userOption.fold(
            () => const AuthenticationState.unauthenticated(),
            (_) => const AuthenticationState.authenticated(),
          ),
        );
      },
    );

    on<SignedOut>(
      (event, emit) async {
        await _authenticationFacade.signOut();

        emit(const AuthenticationState.unauthenticated());
      },
    );
  }
}
