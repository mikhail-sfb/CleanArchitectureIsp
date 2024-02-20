import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  final EmployerEvent event;
  const AddButton({required this.event,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              border: Border(
                  top: BorderSide(
                      width: 2, color: Theme.of(context).primaryColorDark))),
          child: Center(
              child: Text(
            'Add group',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          )),
        ),
        onTap: () {
          context.read<EmployerBloc>().add(event);
        });
  }
}
