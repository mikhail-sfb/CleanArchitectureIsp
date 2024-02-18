import 'package:dartz/dartz.dart';
import 'package:final_lab/core/failures/ifailure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams{}