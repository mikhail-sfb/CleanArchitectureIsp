//*local
import 'package:final_lab/source/features/employer_list/data/models/group_model.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';

abstract class ILocalDataSource {
  Future<void> deleteEmployer({required int groupId, required int employerId});
  Future<void> deleteGroup({required int groupId});

  Future<void> addEmployer({required int groupId, required Employer employer});
  Future<void> addGroup({required Group group});

  Future<void> editEmployer(
      {required int groupId,
      required int employerId,
      required Employer employer});
  Future<void> editGroup({required int groupId, required Group group});

  Future<List<GroupModel>> getGroups();
}
