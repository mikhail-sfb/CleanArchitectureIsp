//*local
import 'package:final_lab/source/features/employer_list/data/models/employer_model.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';

abstract class ILocalDataSource {
  Future<void> deleteEmployer({required String id});
  Future<void> addEmployer({required Employer employer});
  Future<void> editEmployer({required String id, required Employer employer});
  Future<List<EmployerModel>> getEployers();
}
