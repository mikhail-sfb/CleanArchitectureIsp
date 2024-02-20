import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Employer extends Equatable {
  final int age;
  final int importance;
  final String work;
  final String fullName;
  final String id;
  final String? memoryImage;

  Employer(
      {required this.age,
      required this.importance,
      required this.memoryImage,
      required this.work,
      required this.fullName})
      : id = const Uuid().v4();

  @override
  List<String> get props => [id];
}
