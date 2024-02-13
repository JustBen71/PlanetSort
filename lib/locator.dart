import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  // register singletons or services
  locator.registerLazySingleton(() => MVVM_App_Singleton());
  locator.registerLazySingleton(() => MVVM_Api_Service());

  // register models
  locator.registerFactory<MVVM_Example_View_Model>(
    () => MVVM_Example_View_Model(),
  );
}