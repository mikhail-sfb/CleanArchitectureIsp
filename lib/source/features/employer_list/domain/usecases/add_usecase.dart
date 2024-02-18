import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class AddEmployer implements Usecase<void, AddEmployerParams> {
  final ILocalRepo repo;
  AddEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(AddEmployerParams params) async {
    return repo.addEmployer(employer: params.employer);
  }
}

class AddEmployerParams extends Equatable {
  final Employer employer;

  const AddEmployerParams({required this.employer});

  @override
  List<Employer> get props => [employer];
}
