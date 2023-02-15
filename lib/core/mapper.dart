import '../data/dto/application_dto.dart';
import '../data/dto/current_selection_dto.dart';
import '../data/dto/vehicle_dto.dart';
import '../domain/entity/application_entity.dart';
import '../domain/entity/current_selection_entity.dart';
import '../domain/entity/vehicle_entity.dart';

mixin Mapper {
  VehicleEntity mapToVehicleEntity(VehicleDTO from);

  VehicleDTO mapToVehicleDTO(VehicleEntity from);

  ApplicationEntity mapToApplicationEntity(ApplicationDTO from);

  CurrentSelectionEntity mapToCurrentSelectionEntity(CurrentSelectionDTO from);

  CurrentSelectionDTO mapToCurrentSelectionDTO(CurrentSelectionEntity from);
}

class MapperImpl implements Mapper {
  @override
  VehicleEntity mapToVehicleEntity(VehicleDTO from) => VehicleEntity(
        id: from.vehicleId ?? '',
        plate: from.licensePlate,
        model: from.vehicleModel,
      );

  @override
  VehicleDTO mapToVehicleDTO(VehicleEntity from) => VehicleDTO(
        vehicleId: from.id,
        licensePlate: from.plate,
        vehicleModel: from.model,
      );

  @override
  ApplicationEntity mapToApplicationEntity(ApplicationDTO from) =>
      ApplicationEntity(
        id: from.id,
        name: from.name,
        pickupDistances: from.maxPickupDistanceSteps,
      );

  @override
  CurrentSelectionEntity mapToCurrentSelectionEntity(
          CurrentSelectionDTO from) =>
      CurrentSelectionEntity(
          application: from.application,
          vehicle: from.lastSelectedVehicle != null
              ? mapToVehicleEntity(from.lastSelectedVehicle!)
              : null,
          pickupDistance: from.maxPickupRadius);

  @override
  CurrentSelectionDTO mapToCurrentSelectionDTO(CurrentSelectionEntity from) =>
      CurrentSelectionDTO(
          application: from.application,
          lastSelectedVehicle:
              from.vehicle != null ? mapToVehicleDTO(from.vehicle!) : null,
          maxPickupRadius: from.pickupDistance);
}
