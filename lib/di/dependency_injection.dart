import 'package:get_it/get_it.dart';

import '../core/mapper.dart';
import '../data/data_source/app_vehicles_local_datasource.dart';
import '../data/data_source/app_vehicles_remote_datasource.dart';
import '../data/repository/app_vehicles_repository_impl.dart';
import '../domain/repository/app_vehicles_repository.dart';
import '../domain/use_case/get_applications_use_case.dart';
import '../domain/use_case/get_vehicles_use_case.dart';
import '../domain/use_case/manage_current_selection_use_case.dart';

GetIt get di => GetIt.instance;

Future<void> initServiceLocator() async {
  di.registerFactory<Mapper>(() => MapperImpl());

  di.registerFactory(() => AppVehiclesLocalDataSource());

  di.registerFactory(() => AppVehiclesRemoteDataSource());

  di.registerFactory<AppVehiclesRepository>(() => AppVehiclesRepositoryImpl(
        remoteDataSource: di(),
        localDataSource: di(),
        mapper: di(),
      ));

  di.registerFactory(() => GetApplicationsUseCase(repository: di()));

  di.registerFactory(() => GetVehiclesUseCase(repository: di()));

  di.registerLazySingleton(
      () => ManageCurrentSelectionUseCase(repository: di()));
}
