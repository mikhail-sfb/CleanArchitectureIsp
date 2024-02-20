part of 'employer_bloc.dart';

sealed class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => [];
}

final class GroupInitial extends GroupState {}

final class GroupsLoaded extends GroupState {
  final List<Group> groups;

  const GroupsLoaded({required this.groups});

  @override
  List<Object> get props => [
        groups.map((e) => e.groupName).toList(),
        groups.map((e) => e.color).toList()
      ];
}

final class GroupEmpty extends GroupState {}

final class GroupAddDecline extends GroupState {}

final class LocalDbError extends GroupState {
  final String errorMessage;

  const LocalDbError({required this.errorMessage});

  @override
  List<String> get props => [errorMessage];
}
