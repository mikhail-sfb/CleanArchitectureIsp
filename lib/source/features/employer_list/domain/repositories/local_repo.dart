import 'package:dartz/dartz.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';

abstract class ILocalRepo {
  //* failure returns [DataFailure]
  Future<Either<Failure, void>> addEmployer({required Employer employer});
  Future<Either<Failure, void>> deleteEmployer({required String employerId});
  Future<Either<Failure, List<Employer>>> getEployers();
  Future<Either<Failure, void>> editEmployer(
      {required String employerId, required Employer employer});
}
