// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain_driven_design/application/authentication/authentication_bloc.dart'
    as _i8;
import 'package:domain_driven_design/application/authentication/sign_in_form/sign_in_form_bloc.dart'
    as _i7;
import 'package:domain_driven_design/domain/authentication/authentication_facade.dart'
    as _i5;
import 'package:domain_driven_design/infrastructure/authentication/firebase_authentication_facade.dart'
    as _i6;
import 'package:domain_driven_design/infrastructure/core/firebase_injectable_module.dart'
    as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i5.AuthenticationFacade>(
        () => _i6.FirebaseAuthenticationFacade(
              gh<_i3.FirebaseAuth>(),
              gh<_i4.GoogleSignIn>(),
            ));
    gh.lazySingleton<_i7.SignInFormBloc>(
        () => _i7.SignInFormBloc(gh<_i5.AuthenticationFacade>()));
    gh.factory<_i8.AuthenticationBloc>(
        () => _i8.AuthenticationBloc(gh<_i5.AuthenticationFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}
