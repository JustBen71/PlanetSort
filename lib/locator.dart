import 'package:get_it/get_it.dart';
import 'package:planetsort/repository/camera_app_singleton.dart';
import 'package:planetsort/repository/map_app_singleton.dart';
import 'package:planetsort/view_model/camera_view_model.dart';
import 'package:planetsort/view_model/map_view_model.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  // register singletons or services
  locator.registerLazySingleton(() => Camera_App_Singleton());
  locator.registerLazySingleton(() => MapAppSingleton());

  // register models
  locator.registerFactory<Camera_View_Model>(
    () => Camera_View_Model(),
  );

  locator.registerFactory<MapViewModel>(
    () => MapViewModel(),
  );
}








