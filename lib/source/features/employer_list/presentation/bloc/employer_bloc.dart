import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
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

class EmployerBloc extends Bloc<EmployerEvent, EmployerState> {
  final AddEmployer _addEmployer;
  final DeleteEmployer _deleteEmployer;
  final GetEmployers _getEmployers;
  final EditEmployer _editEmployer;

  EmployerBloc(
      {required AddEmployer addEmployer,
      required DeleteEmployer deleteEmployer,
      required EditEmployer editEmployer,
      required GetEmployers getEmployers})
      : _addEmployer = addEmployer,
        _deleteEmployer = deleteEmployer,
        _editEmployer = editEmployer,
        _getEmployers = getEmployers,
        super(EmployerInitial()) {
    on<AddEmployerEvent>(_addEmployerHandler);
    on<DeleteEmployerEvent>(_deleteEmployerHandler);
    on<EditEmployerEvent>(_editEmployerHandler);
    on<GetEmployersEvent>(_getEmployerHandler);
  }

  Future<void> _addEmployerHandler(
      AddEmployerEvent event, Emitter<EmployerState> emit) async {
    final result =
        await _addEmployer(AddEmployerParams(employer: event.employer));

    //*adding
    result.fold((_) => emit(const LocalDbError(errorMessage: addingError)),
        (_) => add(GetEmployersEvent()));
  }

  Future<void> _deleteEmployerHandler(
      DeleteEmployerEvent event, Emitter<EmployerState> emit) async {
    final result = await _deleteEmployer(DeleteEmployerParams(id: event.id));

    //*deleting
    result.fold((_) => emit(const LocalDbError(errorMessage: deleteError)),
        (_) => add(GetEmployersEvent()));
  }

  Future<void> _editEmployerHandler(
      EditEmployerEvent event, Emitter<EmployerState> emit) async {
    final result = await _editEmployer(
        EditEmployerParams(id: event.id, employer: event.employer));
    //*refresh
    result.fold((_) => emit(const LocalDbError(errorMessage: editError)),
        (_) => add(GetEmployersEvent()));
  }

  Future<void> _getEmployerHandler(
      GetEmployersEvent event, Emitter<EmployerState> emit) async {
    final result = await _getEmployers(NoParams());
    result.fold((_) => emit(const LocalDbError(errorMessage: loadError)),
        (employers) {
      //*getting
      if (employers.isEmpty) {
        emit(EmployersEmpty());
      }

      emit(EmployersLoaded(employers: employers));
    });
  }
}
