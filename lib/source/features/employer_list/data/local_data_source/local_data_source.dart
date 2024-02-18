import 'package:final_lab/source/features/employer_list/data/local_data_source/ilocal_data_source.dart';
import 'package:final_lab/source/features/employer_list/data/models/employer_model.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:hive/hive.dart';

class LocalDataSource extends ILocalDataSource {
  final Box box;

  LocalDataSource({required this.box});

  @override
  Future<void> addEmployer({required Employer employer}) async {
    final employerModel = EmployerModel.toModel(employer);
    await box.put(employer.id, employerModel.toJson());
  }

  @override
  Future<void> deleteEmployer({required String id}) async {
    await box.delete(id);
  }

  @override
  Future<void> editEmployer(
      {required String id, required Employer employer}) async {
    final employerModel = EmployerModel.toModel(employer);
    await box.put(id, employerModel.toJson());
  }

  @override
  Future<List<EmployerModel>> getEployers() async {
    //*getting jsons
    final jsonModels = box.values.toList();
    final models =
        jsonModels.map((employer) => EmployerModel.fromJson(employer)).toList();
    return models;
  }
}
