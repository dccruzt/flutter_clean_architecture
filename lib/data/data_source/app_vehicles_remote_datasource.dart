import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../dto/application_dto.dart';
import '../dto/vehicle_dto.dart';

class AppVehiclesRemoteDataSource {
  Future<List<VehicleDTO>?> getVehicles() async {
    try {
      String data =
          await rootBundle.loadString("assets/json/initial_state.json");

      final json = jsonDecode(data);
      return (json['availableVehicles'] as Iterable)
          .map((e) => VehicleDTO.fromJson(e))
          .toList(growable: false);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<ApplicationDTO>?> getApplications() async {
    try {
      String data =
          await rootBundle.loadString("assets/json/initial_state.json");

      final json = jsonDecode(data);
      return (json['applications'] as Iterable)
          .map((e) => ApplicationDTO.fromJson(e))
          .toList(growable: false);
    } catch (_) {
      rethrow;
    }
  }
}
