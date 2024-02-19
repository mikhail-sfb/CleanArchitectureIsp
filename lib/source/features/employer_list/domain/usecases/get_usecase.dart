import 'package:dartz/dartz.dart';
import 'package:final_lab/core/failures/ifailure.dart';
import 'package:final_lab/core/usecases/usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';

class GetGroups implements Usecase<List<Group>, NoParams> {
  final ILocalRepo repo;

  GetGroups({required this.repo});

  @override
  Future<Either<Failure, List<Group>>> call(NoParams params) {
    return repo.getGroups();
  }
}
