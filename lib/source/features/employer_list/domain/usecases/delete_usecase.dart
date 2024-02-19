import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

//*employer
class DeleteEmployer implements Usecase<void, DeleteEmployerParams> {
  final ILocalRepo repo;

  DeleteEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(DeleteEmployerParams params) {
    return repo.deleteEmployer(
        employerId: params.employerId, groupId: params.groupId);
  }
}

class DeleteEmployerParams extends Equatable {
  final int employerId;
  final int groupId;

  const DeleteEmployerParams({required this.employerId, required this.groupId});

  @override
  List<int> get props => [groupId];
}

//*group
class DeleteGroup implements Usecase<void, DeleteGroupParams> {
  final ILocalRepo repo;

  DeleteGroup({required this.repo});

  @override
  Future<Either<Failure, void>> call(DeleteGroupParams params) {
    return repo.deleteGroup(groupId: params.groupId);
  }
}

class DeleteGroupParams extends Equatable {
  final int groupId;

  const DeleteGroupParams({required this.groupId});

  @override
  List<int> get props => [groupId];
}
