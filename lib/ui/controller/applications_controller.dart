import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../di/dependency_injection.dart';
import '../../domain/entity/application_entity.dart';
import '../../domain/use_case/get_applications_use_case.dart';

class ApplicationsCubitProvider extends BlocProvider<ApplicationsCubit> {
  ApplicationsCubitProvider({
    super.key,
    super.child,
    Create<ApplicationsCubit>? create,
    GetApplicationsUseCase? useCase,
  }) : super(
            create: create ??
                (context) =>
                    ApplicationsCubit(useCase: di())..getApplications());

  static ApplicationsCubit of(BuildContext context) =>
      BlocProvider.of<ApplicationsCubit>(context);
}

class ApplicationsCubit extends Cubit<ApplicationsState> {
  ApplicationsCubit({
    required this.useCase,
  }) : super(const ApplicationsState());

  final GetApplicationsUseCase useCase;

  Future<void> getApplications() {
    return useCase
        .call()
        .then((value) => emit(state.copyWith(applications: value)))
        .catchError(
            (error) => emit(state.copyWith(applications: null, error: error)));
  }
}

class ApplicationsState extends Equatable {
  const ApplicationsState({
    this.applications,
    this.error,
  });
  final List<ApplicationEntity>? applications;
  final Object? error;

  ApplicationsState copyWith({
    List<ApplicationEntity>? applications,
    Object? error,
  }) =>
      ApplicationsState(
        applications: applications ?? this.applications,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [applications, error];
}
