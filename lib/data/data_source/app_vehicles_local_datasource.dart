import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/current_selection_dto.dart';

class AppVehiclesLocalDataSource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveCurrentSelection(
      CurrentSelectionDTO currentSelectionDTO) async {
    try {
      final source = currentSelectionDTO.toJson();
      (await _prefs)
          .setString(currentSelectionDTO.application, jsonEncode(source));
    } catch (_) {
      rethrow;
    }
  }

  Future<CurrentSelectionDTO?> readCurrentSelection(String application) async {
    try {
      final source = (await _prefs).getString(application);

      CurrentSelectionDTO? currentSelectionDTO;
      if (source != null) {
        final json = jsonDecode(source);
        currentSelectionDTO = CurrentSelectionDTO.fromJson(application, json);
      }
      return currentSelectionDTO;
    } catch (_) {
      rethrow;
    }
  }
}
