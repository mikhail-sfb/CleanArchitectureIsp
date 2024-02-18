part of 'employer_bloc.dart';

sealed class EmployerEvent extends Equatable {
  const EmployerEvent();

  @override
  List<Object> get props => [];
}

final class AddEmployerEvent extends EmployerEvent {
  final Employer employer;

  const AddEmployerEvent({required this.employer});

  @override
  List<String> get props => [employer.id];
}

final class EditEmployerEvent extends EmployerEvent {
  final String id;
  final Employer employer;

  const EditEmployerEvent({required this.id, required this.employer});

  @override
  List<String> get props => [id];
}

final class GetEmployersEvent extends EmployerEvent {}

final class DeleteEmployerEvent extends EmployerEvent {
  final String id;

  const DeleteEmployerEvent({required this.id});

  @override
  List<String> get props => [id];
}
