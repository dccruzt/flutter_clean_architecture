import '../../core/mapper.dart';
import '../../domain/entity/application_entity.dart';
import '../../domain/entity/current_selection_entity.dart';
import '../../domain/entity/vehicle_entity.dart';
import '../../domain/repository/app_vehicles_repository.dart';
import '../data_source/app_vehicles_local_datasource.dart';
import '../data_source/app_vehicles_remote_datasource.dart';

class AppVehiclesRepositoryImpl implements AppVehiclesRepository {
  AppVehiclesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.mapper,
  });

  final AppVehiclesRemoteDataSource remoteDataSource;
  final AppVehiclesLocalDataSource localDataSource;
  final Mapper mapper;

  @override
  Future<List<VehicleEntity>?> getVehicles() async {
    try {
      final vehicles = await remoteDataSource.getVehicles();
      return vehicles?.map(mapper.mapToVehicleEntity).toList(growable: false);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ApplicationEntity>?> getApplications() async {
    try {
      final applications = await remoteDataSource.getApplications();
      return applications
          ?.map(mapper.mapToApplicationEntity)
          .toList(growable: false);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveCurrentSelection(CurrentSelectionEntity currentSelection) {
    try {
      return localDataSource.saveCurrentSelection(
          mapper.mapToCurrentSelectionDTO(currentSelection));
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<CurrentSelectionEntity?> readCurrentSelection(
      String application) async {
    try {
      final currentSelectionDTO =
          await localDataSource.readCurrentSelection(application);
      CurrentSelectionEntity? currentSelectionEntity;
      if (currentSelectionDTO != null) {
        currentSelectionEntity =
            mapper.mapToCurrentSelectionEntity(currentSelectionDTO);
      }
      return currentSelectionEntity;
    } catch (_) {
      rethrow;
    }
  }
}
