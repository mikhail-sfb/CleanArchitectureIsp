import 'dart:math';

import 'package:final_lab/features/delete_item_provider.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/screens/employer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
  final _textFormKey = GlobalKey<FormState>();
  bool _form = false;
  String _name = '';

  void _changeView() {
    setState(() {
      _form == false ? _form = true : _form = false;
    });
  }

  Future<void> _onSubmitted(BuildContext context) async {
    if (_textFormKey.currentState!.validate()) {
      _textFormKey.currentState!.save();
      Group newGroup = Group(
          groupName: _name,
          color: widget.group.color,
          employers: widget.group.employers);
      context
          .read<EmployerBloc>()
          .add(EditGroupEvent(groupId: widget.index, group: newGroup));
      setState(() => _changeView());
    }
    if (!context.mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Consumer<DeleteItemProvider>(
        builder: (context, value, child) => Container(
          decoration: BoxDecoration(
              color: widget.colorDeafult
                  ? Theme.of(context).colorScheme.secondary
                  : Color(int.parse(widget.group.color)),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height * 0.03)),
              border: Border.all(
                  width: value.toggled && widget.index == value.toggledItem
                      ? 9
                      : 3,
                  color: Theme.of(context).primaryColorDark)),
          child: Center(
              child: _form
                  ? Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Form(
                        key: _textFormKey,
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length <= 1) {
                              return "Name must be grater than 1 character";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _name = newValue!;
                          },
                          onEditingComplete: () => _onSubmitted(context),
                          onTapOutside: (_) => _changeView(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                          cursorColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              hintText: widget.group.groupName,
                              hintStyle:
                                  Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                    )
                  : GestureDetector(
                      child: Text(
                        widget.group.groupName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onLongPress: () => _changeView(),
                    )),
        ),
      ),
      onDoubleTap: () {
        //!change background to random color
        final newHexColor = Color(Random().nextInt(0xffffffff)).toString();
        final colorValue =
            newHexColor.replaceFirst("Color(", "").replaceFirst(")", "");

        final newGroup = Group(
            groupName: widget.group.groupName,
            color: colorValue,
            employers: widget.group.employers);
        context
            .read<EmployerBloc>()
            .add(EditGroupEvent(groupId: widget.index, group: newGroup));
      },
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        bool empty = widget.group.employers.isEmpty;
        return BlocProvider.value(
          value: BlocProvider.of<EmployerBloc>(context),
          child: EmployerList(
              empty: empty, group: widget.group, groupId: widget.index),
        );
      })),
      onLongPress: () => Provider.of<DeleteItemProvider>(context, listen: false)
          .toogleGroup(id: widget.index),
    );
  }
}
