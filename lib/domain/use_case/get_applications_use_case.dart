import '../entity/application_entity.dart';
import '../repository/app_vehicles_repository.dart';

abstract class UseCase<Result> {
  Future<Result> call();
}

class GetApplicationsUseCase implements UseCase<List<ApplicationEntity>?> {
  GetApplicationsUseCase({required this.repository});

  final AppVehiclesRepository repository;

  @override
  Future<List<ApplicationEntity>?> call() {
    try {
      return repository.getApplications();
    } catch (_) {
      rethrow;
    }
  }
}
