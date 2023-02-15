import 'package:rxdart/rxdart.dart';

import '../entity/current_selection_entity.dart';
import '../repository/app_vehicles_repository.dart';

class ManageCurrentSelectionUseCase {
  ManageCurrentSelectionUseCase({
    required this.repository,
  });

  final AppVehiclesRepository repository;

  late final BehaviorSubject<CurrentSelectionEntity?> _controller =
      BehaviorSubject();

  Stream<CurrentSelectionEntity?> get stream => _controller.stream.distinct();

  Future<void> read(String params) async {
    try {
      final currentSelection = await repository.readCurrentSelection(params);
      _controller.add(currentSelection);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> set(CurrentSelectionEntity params) async {
    try {
      _controller.add(params);
      repository.saveCurrentSelection(params);
    } catch (_) {
      rethrow;
    }
  }
}
