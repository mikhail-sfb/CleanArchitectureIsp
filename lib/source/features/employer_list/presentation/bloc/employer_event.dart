part of 'employer_bloc.dart';

sealed class EmployerEvent extends Equatable {
  const EmployerEvent();

  @override
  List<Object> get props => [];
}

//*add
final class AddEmployerEvent extends EmployerEvent {
  final Employer employer;
  final int groupId;

  const AddEmployerEvent({required this.groupId, required this.employer});

  @override
  List<String> get props => [employer.id];
}

final class AddGroupEvent extends EmployerEvent {
  final Group group;

  const AddGroupEvent({required this.group});

  @override
  List<String> get props => [group.groupName];
}

//*edit
final class EditEmployerEvent extends EmployerEvent {
  final int groupId;
  final int employerId;
  final Employer employer;

  const EditEmployerEvent(
      {required this.groupId,
      required this.employerId,
      required this.employer});

  @override
  List<Employer> get props => [employer];
}

final class EditGroupEvent extends EmployerEvent {
  final int groupId;
  final Group group;

  const EditGroupEvent({required this.groupId, required this.group});

  @override
  List<Group> get props => [group];
}

//*get
final class GetGroupsEvent extends EmployerEvent {}

//*delete
final class DeleteEmployerEvent extends EmployerEvent {
  final int employerId;
  final int groupId;

  const DeleteEmployerEvent({required this.employerId, required this.groupId});

  @override
  List<int> get props => [groupId, employerId];
}

final class DeleteGroupEvent extends EmployerEvent {
  final int groupId;

  const DeleteGroupEvent({required this.groupId});

  @override
  List<int> get props => [groupId];
}
