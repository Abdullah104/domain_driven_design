import 'package:domain_driven_design/firebase_options.dart';
import 'package:domain_driven_design/injection.dart';
import 'package:domain_driven_design/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureInjection();

  runApp(AppWidget());
}
