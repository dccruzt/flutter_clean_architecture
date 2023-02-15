import '../entity/application_entity.dart';
import '../entity/current_selection_entity.dart';
import '../entity/vehicle_entity.dart';

abstract class AppVehiclesRepository {
  Future<List<VehicleEntity>?> getVehicles();

  Future<List<ApplicationEntity>?> getApplications();

  Future<void> saveCurrentSelection(CurrentSelectionEntity currentSelection);

  Future<CurrentSelectionEntity?> readCurrentSelection(String application);
}
