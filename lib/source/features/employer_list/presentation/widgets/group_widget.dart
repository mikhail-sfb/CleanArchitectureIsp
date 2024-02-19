import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  final Group group;
  final bool colorDeafult;
  const GroupItem({required this.colorDeafult, required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            //* color: colorDeafult
            //*     ? Theme.of(context).colorScheme.secondary
            //*     : Color(int.parse(group.color)),
            color:
                const Color(0xFF42A5F5), //!delete later replace with upper one
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.height * 0.03))),
        child: Center(
            child: Text(
          group.groupName,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
