import 'dart:math';

import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupItem extends StatefulWidget {
  final Group group;
  final int index;
  final bool colorDeafult;

  const GroupItem(
      {required this.index,
      required this.colorDeafult,
      required this.group,
      super.key});

  @override
  State<GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  bool showPlainInfo = true;
  final textController = TextEditingController();

  void changeView() {
    setState(() {
      showPlainInfo == false ? showPlainInfo = true : showPlainInfo = false;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return showPlainInfo
        ? InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: widget.colorDeafult
                      ? Theme.of(context).colorScheme.secondary
                      : Color(int.parse(widget.group.color)),
                  //color: const Color(
                  //   0xFF42A5F5), //!delete later replace with upper one
                  borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.height * 0.03)),
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColorDark)),
              child: Center(
                  child: Text(
                widget.group.groupName,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
            ),
            onDoubleTap: () {
              //!change background to random color
              final newHexColor = Color(Random().nextInt(0xffffffff)).toString();
final colorValue = newHexColor.replaceFirst("Color(", "").replaceFirst(")", "");

              final newGroup = Group(
                  groupName: widget.group.groupName,
                  color: colorValue,
                  employers: widget.group.employers);
              context
                  .read<EmployerBloc>()
                  .add(EditGroupEvent(groupId: widget.index, group: newGroup));
            },
            onLongPress: () => changeView(),
          )
        : Container(
            decoration: BoxDecoration(
                //* color: colorDeafult
                //*     ? Theme.of(context).colorScheme.secondary
                //*     : Color(int.parse(group.color)),
                color: const Color.fromARGB(
                    255, 74, 87, 107), //!delete later replace with upper one
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.height * 0.03)),
                border: Border.all(
                    width: 3, color: Theme.of(context).primaryColorDark)),
            child: Center(
                child: TextField(
              controller: textController,
              decoration: InputDecoration(hintText: widget.group.groupName),
            )),
          );
  }
}
