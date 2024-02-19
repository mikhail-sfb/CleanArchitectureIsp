import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

//*employer
class AddEmployer implements Usecase<void, AddEmployerParams> {
  final ILocalRepo repo;
  AddEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(AddEmployerParams params) async {
    return repo.addEmployer(groupId: params.groupId, employer: params.employer);
  }
}

class AddEmployerParams extends Equatable {
  final Employer employer;
  final int groupId;

  const AddEmployerParams({required this.groupId, required this.employer});

  @override
  List<Employer> get props => [employer];
}

//*group
class AddGroup implements Usecase<void, AddGroupParams> {
  final ILocalRepo repo;
  AddGroup({required this.repo});

  @override
  Future<Either<Failure, void>> call(AddGroupParams params) async {
    return repo.addGroup(group: params.group);
  }
}

class AddGroupParams extends Equatable {
  final Group group;

  const AddGroupParams({required this.group});

  @override
  List<Group> get props => [group];
}
