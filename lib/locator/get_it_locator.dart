import 'package:get_it/get_it.dart';
import 'package:qualtrics_digit/qualtrics/qualtrics_manager.dart';
import 'package:qualtrics_digital_flutter_plugin/qualtrics_digital_flutter_plugin.dart';

final sl = GetIt.I;

void setupLocator() {
  sl.registerLazySingleton(() => QualtricsManagerImpl(sl()));
  sl.registerLazySingleton(() => QualtricsDigitalFlutterPlugin());
}
