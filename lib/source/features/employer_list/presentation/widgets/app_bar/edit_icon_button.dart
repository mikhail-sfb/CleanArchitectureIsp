import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/screens/add_employer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditButton extends StatelessWidget {
  final int groupId;
  final int employerId;
  final Employer employer;

  const EditButton(
      {super.key,
      required this.groupId,
      required this.employerId,
      required this.employer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => BlocProvider.value(
                    value: BlocProvider.of<EmployerBloc>(context),
                    child: AddEmployerScreen(
                        groupId: groupId,
                        employer: employer,
                        employerId: employerId),
                  )));
        },
        icon: Icon(
          Icons.edit,
          color: Theme.of(context).iconTheme.color,
        ));
  }
}
