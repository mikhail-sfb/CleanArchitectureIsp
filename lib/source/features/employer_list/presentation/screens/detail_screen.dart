import 'dart:io';

import 'package:final_lab/core/widgets/app_bar.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/app_bar/edit_icon_button.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/employers/details.dart';
import 'package:flutter/material.dart';

class DetailEmployerScreen extends StatelessWidget {
  final Employer employer;
  const DetailEmployerScreen({required this.employer, super.key});

  @override
  Widget build(BuildContext context) {
    final employerInfo = [
      employer.fullName,
      employer.age.toString(),
      employer.work,
      employer.importance.toString()
    ];
    return Scaffold(
      appBar: const ApplicationBar(
        title: 'Details',
        actions: [EditButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(50),
                  child: Image.file(
                    File(employer.memoryImage!),
                    height: 350,
                    width: 350,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                employer.fullName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: propAmountEmployer,
                  itemBuilder: (context, index) => DescreptionElement(
                      title: titles[index], info: employerInfo[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
