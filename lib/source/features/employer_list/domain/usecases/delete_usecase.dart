import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class DeleteEmployer implements Usecase<void, DeleteEmployerParams> {
  final ILocalRepo repo;

  DeleteEmployer({required this.repo});

  @override
  Future<Either<Failure, void>> call(DeleteEmployerParams params) {
    return repo.deleteEmployer(employerId: params.id);
  }
}

class DeleteEmployerParams extends Equatable {
  final String id;

  const DeleteEmployerParams({required this.id});

  @override
  List<String> get props => [id];
}
