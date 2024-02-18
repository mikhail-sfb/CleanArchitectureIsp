import 'dart:convert';

import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';

class EmployerModel extends Employer {
  EmployerModel({
    required super.age,
    required super.importance,
    required super.work,
    required super.fullName,
  });

  //*to_map
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'importance': importance,
      'work': work,
      'fullName': fullName
    };
  }

  //*from_map
  factory EmployerModel.fromMap(Map<String, dynamic> map) => EmployerModel(
      age: map['age'] as int,
      importance: map['importance'],
      work: map['work'],
      fullName: map['fullName']);

  //*to_string_source
  String toJson() => jsonEncode(toMap());

  //*from_json_source
  factory EmployerModel.fromJson(String source) =>
      EmployerModel.fromMap(jsonDecode(source));

  //*to_model
  factory EmployerModel.toModel(Employer employer) => EmployerModel(
      age: employer.age,
      importance: employer.importance,
      work: employer.work,
      fullName: employer.fullName);
}
