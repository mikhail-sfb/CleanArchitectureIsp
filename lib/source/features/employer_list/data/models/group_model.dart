import 'dart:convert';

import 'package:final_lab/source/features/employer_list/data/models/employer_model.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';

class GroupModel extends Group {
  const GroupModel(
      {required super.groupName,
      required super.color,
      required super.employers});

//*to_map
  Map<String, dynamic> toMap() {
    return {'employers': employers, 'color': color, 'groupName': groupName};
  }

//*from_map
  factory GroupModel.fromMap(Map<String, dynamic> map) {
    final mappedEmployers = map['employers'] as List<dynamic>;
    final employers =
        mappedEmployers.map((e) => EmployerModel.fromJson(e)).toList();
    return GroupModel(
        color: map['color'] as String,
        groupName: map['groupName'] as String,
        employers: employers);
  }

  //*to_string_source
  String toJson() => jsonEncode(toMap());

  //*from_json_source
  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(jsonDecode(source));

  //*to_model
  factory GroupModel.toModel(Group group) => GroupModel(
      groupName: group.groupName,
      color: group.color,
      employers: group.employers);

  @override
  List<String> get props => [groupName];
}
