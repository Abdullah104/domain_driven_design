import 'package:domain_driven_design/application/authentication/authentication_bloc.dart';
import 'package:domain_driven_design/injection.dart';
import 'package:domain_driven_design/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => getIt()
            ..add(const AuthenticationEvent.authenticationCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Colors.green,
            secondary: Colors.blueAccent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
