import 'package:dartz/dartz.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class GetEmployers implements Usecase<List<Employer>, NoParams> {
  final ILocalRepo repo;

  GetEmployers({required this.repo});

  @override
  Future<Either<Failure, List<Employer>>> call(NoParams params) {
    return repo.getEployers();
  }
}
