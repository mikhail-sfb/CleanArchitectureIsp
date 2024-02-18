import 'package:final_lab/core/exceptions/local_db_exception.dart';
import 'package:final_lab/core/failures/ifailure.dart';

class DataFailure extends Failure {
  const DataFailure();

  const DataFailure.fromException(LocalDbException exception) : this();

  @override
  List<Object?> get props => [];
}
