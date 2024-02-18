import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class EditEmployer implements Usecase<void, EditEmployerParams> {
  final ILocalRepo repo;

  EditEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(EditEmployerParams params) {
    return repo.editEmployer(employerId: params.id, employer: params.employer);
  }
}

class EditEmployerParams extends Equatable {
  final String id;
  final Employer employer;

  const EditEmployerParams({required this.id, required this.employer});

  @override
  List<dynamic> get props => [id, employer];
}
