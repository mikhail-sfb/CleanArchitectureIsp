import 'package:equatable/equatable.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';

class Group extends Equatable {
  final String groupName;
  final String color;
  final List<Employer> employers;

  const Group(
      {required this.groupName, required this.color, required this.employers});

  @override
  List<String> get props => [groupName];
}
