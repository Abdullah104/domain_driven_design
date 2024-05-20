import 'package:domain_driven_design/firebase_options.dart';
import 'package:domain_driven_design/injection.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureInjection();
}
