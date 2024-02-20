import 'dart:io';

import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:flutter/material.dart';

class EmployerTile extends StatelessWidget {
  final Employer employer;
  const EmployerTile({required this.employer, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: employer.memoryImage == null
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColorDark),
                    color: const Color.fromARGB(255, 74, 77, 107)),
                child: Center(
                  child: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              )
            : Image.file(File(employer.memoryImage!)),
      ),
    );
  }
}
