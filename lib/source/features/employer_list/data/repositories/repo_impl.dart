import 'package:dartz/dartz.dart';
import 'package:final_lab/core/exceptions/local_db_exception.dart';
import 'package:final_lab/core/failures/data_failure.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/source/features/employer_list/data/local_data_source/ilocal_data_source.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class LocalRepoImpl implements ILocalRepo {
  final ILocalDataSource source;

  LocalRepoImpl({required this.source});

  //*add
  @override
  Future<Either<Failure, void>> addEmployer(
      {required int groupId, required Employer employer}) async {
    try {
      source.addEmployer(groupId: groupId, employer: employer);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, void>> addGroup({required Group group}) async {
    try {
      source.addGroup(group: group);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

//*delete
  @override
  Future<Either<Failure, void>> deleteEmployer(
      {required int groupId, required int employerId}) async {
    try {
      source.deleteEmployer(employerId: employerId, groupId: groupId);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteGroup({required int groupId}) async {
    try {
      source.deleteGroup(groupId: groupId);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

//*edit
  @override
  Future<Either<Failure, void>> editEmployer(
      {required int groupId,
      required int employerId,
      required Employer employer}) async {
    try {
      source.editEmployer(
          employerId: employerId, groupId: groupId, employer: employer);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, void>> editGroup(
      {required int groupId, required Group group}) async {
    try {
      source.editGroup(group: group, groupId: groupId);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, List<Group>>> getGroups() async {
    try {
      final result = await source.getGroups();
      return Right(result);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }
}
