// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_clean_architecture/test/domain/use_case/manage_current_selection_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_clean_architecture/domain/entity/application_entity.dart'
    as _i5;
import 'package:flutter_clean_architecture/domain/entity/current_selection_entity.dart'
    as _i6;
import 'package:flutter_clean_architecture/domain/entity/vehicle_entity.dart'
    as _i4;
import 'package:flutter_clean_architecture/domain/repository/app_vehicles_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AppVehiclesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppVehiclesRepository extends _i1.Mock
    implements _i2.AppVehiclesRepository {
  MockAppVehiclesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.VehicleEntity>?> getVehicles() => (super.noSuchMethod(
        Invocation.method(
          #getVehicles,
          [],
        ),
        returnValue: _i3.Future<List<_i4.VehicleEntity>?>.value(),
      ) as _i3.Future<List<_i4.VehicleEntity>?>);
  @override
  _i3.Future<List<_i5.ApplicationEntity>?> getApplications() =>
      (super.noSuchMethod(
        Invocation.method(
          #getApplications,
          [],
        ),
        returnValue: _i3.Future<List<_i5.ApplicationEntity>?>.value(),
      ) as _i3.Future<List<_i5.ApplicationEntity>?>);
  @override
  _i3.Future<void> saveCurrentSelection(
          _i6.CurrentSelectionEntity? currentSelection) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCurrentSelection,
          [currentSelection],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<_i6.CurrentSelectionEntity?> readCurrentSelection(
          String? application) =>
      (super.noSuchMethod(
        Invocation.method(
          #readCurrentSelection,
          [application],
        ),
        returnValue: _i3.Future<_i6.CurrentSelectionEntity?>.value(),
      ) as _i3.Future<_i6.CurrentSelectionEntity?>);
}
