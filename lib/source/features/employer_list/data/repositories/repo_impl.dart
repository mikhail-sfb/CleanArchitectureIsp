import 'package:dartz/dartz.dart';
import 'package:final_lab/core/exceptions/local_db_exception.dart';
import 'package:final_lab/core/failures/data_failure.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/source/features/employer_list/data/local_data_source/ilocal_data_source.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class LocalRepoImpl implements ILocalRepo {
  final ILocalDataSource source;

  LocalRepoImpl({required this.source});

  @override
  Future<Either<Failure, void>> addEmployer(
      {required Employer employer}) async {
    try {
      source.addEmployer(employer: employer);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmployer(
      {required String employerId}) async {
    try {
      source.deleteEmployer(id: employerId);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, void>> editEmployer(
      {required String employerId, required Employer employer}) async {
    try {
      source.editEmployer(id: employerId, employer: employer);
      return const Right(null);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }

  @override
  Future<Either<Failure, List<Employer>>> getEployers() async {
    try {
      final result = await source.getEployers();
      return Right(result);
    } catch (_) {
      return Left(DataFailure.fromException(LocalDbException()));
    }
  }
}
