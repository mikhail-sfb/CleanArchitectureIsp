import 'dart:io';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/presentation/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class EmployerTile extends StatelessWidget {
  final Employer employer;
  final int index;
  final int groupId;
  const EmployerTile({required this.index,required this.groupId,required this.employer, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.file(File(employer.memoryImage!)),
          title: Text(
            employer.fullName,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          subtitle: Text(
            employer.work,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.arrow_forward),
          iconColor: Theme.of(context).colorScheme.secondary,
          dense: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color: employer.importance > 6
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.red)),
          selectedColor: const Color.fromARGB(164, 147, 212, 255),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => DetailEmployerScreen(
                      employer: employer,
                    )));
          }),
    );
  }
}
