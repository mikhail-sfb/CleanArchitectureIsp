part of 'employer_bloc.dart';

sealed class EmployerState extends Equatable {
  const EmployerState();

  @override
  List<Object> get props => [];
}

final class EmployerInitial extends EmployerState {}

final class EmployersLoaded extends EmployerState {
  final List<Employer> employers;

  const EmployersLoaded({required this.employers});

  @override
  List<Object> get props => employers.map((employer) => employer.id).toList();
}

final class EmployersEmpty extends EmployerState {}

final class LocalDbError extends EmployerState {
  final String errorMessage;

  const LocalDbError({required this.errorMessage});

   @override
  List<String> get props => [errorMessage];
}
