// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh_C__vS-54IUGSlmAlUD2z8A4wHT7JNM',
    appId: '1:579267211461:android:1443ca3009c15bf7b100ac',
    messagingSenderId: '579267211461',
    projectId: 'domain-driven-design-95e97',
    storageBucket: 'domain-driven-design-95e97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnjEk6la8F-yuAmoRn8AGTgcWF7d37WUM',
    appId: '1:579267211461:ios:be71a97661eb9410b100ac',
    messagingSenderId: '579267211461',
    projectId: 'domain-driven-design-95e97',
    storageBucket: 'domain-driven-design-95e97.appspot.com',
    androidClientId: '579267211461-8ao823dnjbv0v86d5n3n3rnptb22071s.apps.googleusercontent.com',
    iosClientId: '579267211461-v3n3i364fpqsgv0pkrg04uidj9o4mv8m.apps.googleusercontent.com',
    iosBundleId: 'com.example.domainDrivenDesign',
  );

}