import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/add_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/delete_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/edit_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/get_usecase.dart';

part 'employer_event.dart';
part 'employer_state.dart';

const String loadError = 'load error';
const String addingError = 'add error';
const String editError = 'edit error';
const String deleteError = 'delete error';

class EmployerBloc extends Bloc<EmployerEvent, GroupState> {
  final AddEmployer _addEmployer;
  final AddGroup _addGroup;
  final DeleteEmployer _deleteEmployer;
  final DeleteGroup _deleteGroup;
  final GetGroups _getGroups;
  final EditEmployer _editEmployer;
  final EditGroup _editGroup;

  EmployerBloc(
      {required AddEmployer addEmployer,
      required AddGroup addGroup,
      required DeleteEmployer deleteEmployer,
      required DeleteGroup deleteGroup,
      required EditEmployer editEmployer,
      required EditGroup editGroup,
      required GetGroups getGroups})
      : _addEmployer = addEmployer,
        _addGroup = addGroup,
        _deleteEmployer = deleteEmployer,
        _deleteGroup = deleteGroup,
        _editEmployer = editEmployer,
        _editGroup = editGroup,
        _getGroups = getGroups,
        super(GroupInitial()) {
    on<AddEmployerEvent>(_addEmployerHandler);
    on<AddGroupEvent>(_addGroupHandler);
    on<DeleteEmployerEvent>(_deleteEmployerHandler);
    on<DeleteGroupEvent>(_deleteGroupHandler);
    on<EditEmployerEvent>(_editEmployerHandler);
    on<EditGroupEvent>(_editGroupHandler);
    on<GetGroupsEvent>(_getGroupsHandler);
  }

  Future<void> _addEmployerHandler(
      AddEmployerEvent event, Emitter<GroupState> emit) async {
    final result = await _addEmployer(
        AddEmployerParams(groupId: event.groupId, employer: event.employer));

    //*adding
    result.fold((_) => emit(const LocalDbError(errorMessage: addingError)),
        (_) => add(GetGroupsEvent()));
  }

  Future<void> _addGroupHandler(
      AddGroupEvent event, Emitter<GroupState> emit) async {
    final result = await _addGroup(AddGroupParams(group: event.group));

    result.fold((_) => emit(const LocalDbError(errorMessage: addingError)),
        (_) => add(GetGroupsEvent()));
  }

  //*deleting
  Future<void> _deleteEmployerHandler(
      DeleteEmployerEvent event, Emitter<GroupState> emit) async {
    final result = await _deleteEmployer(DeleteEmployerParams(
        employerId: event.employerId, groupId: event.groupId));

    result.fold((_) => emit(const LocalDbError(errorMessage: deleteError)),
        (_) => add(GetGroupsEvent()));
  }

  Future<void> _deleteGroupHandler(
      DeleteGroupEvent event, Emitter<GroupState> emit) async {
    final result =
        await _deleteGroup(DeleteGroupParams(groupId: event.groupId));

    result.fold((_) => emit(const LocalDbError(errorMessage: deleteError)),
        (_) => add(GetGroupsEvent()));
  }

  //*editing
  Future<void> _editEmployerHandler(
      EditEmployerEvent event, Emitter<GroupState> emit) async {
    final result = await _editEmployer(EditEmployerParams(
        employer: event.employer,
        employerId: event.employerId,
        groupId: event.groupId));

    //*refresh
    result.fold((_) => emit(const LocalDbError(errorMessage: editError)),
        (_) => add(GetGroupsEvent()));
  }

  Future<void> _editGroupHandler(
      EditGroupEvent event, Emitter<GroupState> emit) async {
    final result = await _editGroup(
        EditGroupParams(groupId: event.groupId, group: event.group));

    //*refresh
    result.fold((_) => emit(const LocalDbError(errorMessage: editError)),
        (_) => add(GetGroupsEvent()));
  }

  Future<void> _getGroupsHandler(
      GetGroupsEvent event, Emitter<GroupState> emit) async {
    final result = await _getGroups(NoParams());
    result.fold((_) => emit(const LocalDbError(errorMessage: loadError)),
        (groups) {
      //*getting
      if (groups.isEmpty) {
        emit(GroupEmpty());
        return;
      }

      emit(GroupsLoaded(groups: groups));
    });
  }
}
