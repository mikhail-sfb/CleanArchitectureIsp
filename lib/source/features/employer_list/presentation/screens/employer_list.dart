import 'package:final_lab/core/widgets/app_bar.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/screens/employer_item.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/employers/add_employer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployerList extends StatelessWidget {
  final int groupId;
  final bool empty;
  final Group group;
  const EmployerList(
      {required this.empty,
      required this.group,
      required this.groupId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ApplicationBar(title: 'Employers'),
        body: Column(children: [
          empty
              ? Expanded(
                  child: Center(
                    child: Text(
                      'No employers for now',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: group.employers.length,
                      itemBuilder: (context, index) => Dismissible(
                          key: ValueKey(group.employers[index]),
                          background: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight),
                            child: Center(
                              child: Text(
                                'Delete element',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => context.read<EmployerBloc>().add(
                              DeleteEmployerEvent(
                                  employerId: index, groupId: groupId)),
                          child: EmployerTile(
                            groupId: groupId,
                            index: index,
                            employer: group.employers[index],
                          ))),
                ),
          AddEmployerButton(
            groupId: groupId,
            title: 'employer',
          ),
        ]));
  }
}
