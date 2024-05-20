import 'package:domain_driven_design/injection.config.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance();

@InjectableInit()
void configureInjection() => getIt.init();
