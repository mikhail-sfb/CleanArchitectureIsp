import 'package:final_lab/source/features/employer_list/data/local_data_source/ilocal_data_source.dart';
import 'package:final_lab/source/features/employer_list/data/models/group_model.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:hive/hive.dart';

class LocalDataSource extends ILocalDataSource {
  final Box box;

  LocalDataSource({required this.box});

  //*add stuff
  @override
  Future<void> addEmployer(
      {required int groupId, required Employer employer}) async {
    final group = GroupModel.fromJson(box.getAt(groupId));
    group.employers.add(employer);
    await box.putAt(groupId, group.toJson());
  }

  @override
  Future<void> addGroup({required Group group}) async {
    final groupModel = GroupModel.toModel(group);
    await box.add(groupModel.toJson());
  }

  //*delete stuff
  @override
  Future<void> deleteEmployer(
      {required int groupId, required int employerId}) async {
    final group = GroupModel.fromJson(box.getAt(groupId));
    group.employers.removeAt(employerId);
    await box.putAt(groupId, group.toJson());
  }

  @override
  Future<void> deleteGroup({required int groupId}) async {
    await box.deleteAt(groupId);
  }

  //*edit stuff
  @override
  Future<void> editEmployer(
      {required int groupId,
      required int employerId,
      required Employer employer}) async {
    final group = GroupModel.fromJson(box.getAt(groupId));

    group.employers[employerId] = employer;
    await box.put(groupId, group.toJson());
  }

  @override
  Future<void> editGroup({required int groupId, required Group group}) async {
    await box.putAt(groupId, GroupModel.toModel(group).toJson());
  }

  //*get
  @override
  Future<List<GroupModel>> getGroups() async {
    //*getting jsons
    final jsonModels = box.values.toList();
    final models =
        jsonModels.map((group) => GroupModel.fromJson(group)).toList();
    return models;
  }
}
