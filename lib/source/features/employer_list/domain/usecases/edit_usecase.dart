import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

//*employer
class EditEmployer implements Usecase<void, EditEmployerParams> {
  final ILocalRepo repo;

  EditEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(EditEmployerParams params) {
    return repo.editEmployer(
        employer: params.employer,
        employerId: params.employerId,
        groupId: params.groupId);
  }
}

class EditEmployerParams extends Equatable {
  final int groupId;
  final int employerId;
  final Employer employer;

  const EditEmployerParams(
      {required this.employerId,
      required this.groupId,
      required this.employer});

  @override
  List<int> get props => [groupId, employerId];
}

//*group
class EditGroup implements Usecase<void, EditGroupParams> {
  final ILocalRepo repo;

  EditGroup({required this.repo});

  @override
  Future<Either<Failure, void>> call(EditGroupParams params) {
    return repo.editGroup(group: params.group, groupId: params.groupId);
  }
}

class EditGroupParams extends Equatable {
  final int groupId;
  final Group group;

  const EditGroupParams({required this.groupId, required this.group});

  @override
  List<int> get props => [groupId, groupId];
}
