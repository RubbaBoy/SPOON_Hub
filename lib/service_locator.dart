import 'package:get_it/get_it.dart';
import 'package:spoon_hub/scoped_model/home_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register services

  // Register models
  locator.registerFactory(() => HomeModel());

  // A widget models
}
