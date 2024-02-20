import 'package:final_lab/core/constants/color_constants.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroupDialog extends StatefulWidget {
  const AddGroupDialog({super.key});

  @override
  State<AddGroupDialog> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final _textFormKey = GlobalKey<FormState>();
  String _groupName = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Form(
            key: _textFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
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
                    _groupName = newValue!;
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 75, 75, 75)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight),
                      ),
                      hintText: 'Enter group name',
                      hintStyle: Theme.of(context).textTheme.titleMedium),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_textFormKey.currentState!.validate()) {
                      _textFormKey.currentState!.save();
                      Group newGroup = Group(
                          groupName: _groupName,
                          color: groupInitialColor,
                          employers: const <Employer>[]);
                      context
                          .read<EmployerBloc>()
                          .add(AddGroupEvent(group: newGroup));
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Create group',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
