import 'package:dartz/dartz.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';

abstract class ILocalRepo {
  //* failure returns [DataFailure]
  Future<Either<Failure, void>> addEmployer(
      {required int groupId, required Employer employer});
  Future<Either<Failure, void>> addGroup({required Group group});

  Future<Either<Failure, void>> deleteEmployer(
      {required int groupId, required int employerId});
  Future<Either<Failure, void>> deleteGroup({required int groupId});

  Future<Either<Failure, void>> editEmployer(
      {required int groupId,
      required int employerId,
      required Employer employer});
  Future<Either<Failure, void>> editGroup(
      {required int groupId, required Group group});

  Future<Either<Failure, List<Group>>> getGroups();
}
