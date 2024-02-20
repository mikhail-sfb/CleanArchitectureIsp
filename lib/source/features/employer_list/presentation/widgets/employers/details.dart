import 'package:flutter/material.dart';

class DescreptionElement extends StatelessWidget {
  const DescreptionElement(
      {super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "${title.firstUp()}:",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(info, style: Theme.of(context).textTheme.titleSmall)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String firstUp() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}