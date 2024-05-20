import 'package:another_flushbar/flushbar_helper.dart';
import 'package:domain_driven_design/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:domain_driven_design/domain/authentication/authentication_failure.dart';
import 'package:domain_driven_design/domain/core/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authenticationFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) => FlushbarHelper.createError(
              message: switch (failure) {
                CancelledByUser() => 'Cancelled',
                ServerError() => 'Server Error',
                EmailAlreadyInUse() => 'Email already in use',
                InvalidEmailAndPasswordCombination() =>
                  'Invalid email and password combination',
              },
            ).show(context),
            (_) => null,
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: switch (state.showErrorMessages) {
            true => AutovalidateMode.always,
            false => AutovalidateMode.disabled,
          },
          child: ListView(
            children: [
              const Text(
                '📝',
                style: TextStyle(
                  fontSize: 136,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .watch<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (failure) =>
                          failure is InvalidEmail ? 'Invalid Email' : null,
                      (_) => null,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) => context
                    .watch<SignInFormBloc>()
                    .state
                    .password
                    .value
                    .fold(
                      (failure) =>
                          failure is ShortPassword ? 'Short Password' : null,
                      (_) => null,
                    ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed(),
                          ),
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed(),
                          ),
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => context.read<SignInFormBloc>().add(
                      const SignInFormEvent.signInWithGooglePressed(),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('SIGN IN WITH GOOGLE'),
              ),
            ],
          ),
        );
      },
    );
  }
}
