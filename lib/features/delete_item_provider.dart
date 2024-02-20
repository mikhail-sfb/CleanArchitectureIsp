import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteItemProvider with ChangeNotifier {
  int toggledItem = 0;
  bool toggled = false;

  void toogleGroup({required int id}) {
    toggled == false ? toggled = true : toggled = false;

    toggledItem = id;
    notifyListeners();
  }

  void deleteGroup({required BuildContext context, required int groupId}) {
    context.read<EmployerBloc>().add(DeleteGroupEvent(groupId: groupId));
    toogleGroup(id: groupId);
  }
}
