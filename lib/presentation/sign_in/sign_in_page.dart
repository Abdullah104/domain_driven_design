import 'package:domain_driven_design/application/authentication/sign_in_form/sign_in_form_bloc.dart';
import 'package:domain_driven_design/injection.dart';
import 'package:domain_driven_design/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocProvider(
        create: (_) => getIt<SignInFormBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}
