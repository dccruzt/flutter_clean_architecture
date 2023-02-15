import '../entity/vehicle_entity.dart';
import '../repository/app_vehicles_repository.dart';

abstract class UseCase<Result> {
  Future<Result> call();
}

class GetVehiclesUseCase implements UseCase<List<VehicleEntity>?> {
  GetVehiclesUseCase({required this.repository});

  final AppVehiclesRepository repository;

  @override
  Future<List<VehicleEntity>?> call() {
    try {
      return repository.getVehicles();
    } catch (_) {
      rethrow;
    }
  }
}
