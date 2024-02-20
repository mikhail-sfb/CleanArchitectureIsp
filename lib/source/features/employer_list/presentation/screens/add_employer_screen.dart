import 'package:final_lab/core/widgets/app_bar.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/employers/input_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployerScreen extends StatefulWidget {
  final int groupId;
  const AddEmployerScreen({required this.groupId, super.key});

  @override
  State<AddEmployerScreen> createState() => _AddEmployerScreenState();
}

class _AddEmployerScreenState extends State<AddEmployerScreen> {
  String? _picture;
  int _importance = 0;
  int _age = 0;
  String _work = '';
  String _fullName = '';
  final _textFormKey = GlobalKey<FormState>();

  void onReset() {
    _textFormKey.currentState!.reset();
  }

  void onSubmit() {
    if (_textFormKey.currentState!.validate()) {
      _textFormKey.currentState!.save();
      Employer newEmployer = Employer(
          age: _age,
          importance: _importance,
          memoryImage: _picture,
          work: _work,
          fullName: _fullName);

      context.read<EmployerBloc>().add(
          AddEmployerEvent(groupId: widget.groupId, employer: newEmployer));
      Navigator.of(context).pop();
    }

    if (_picture == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: Theme.of(context).primaryColorLight,
          content: Text(
            'Set image first!',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )));
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ApplicationBar(title: 'Add emloyer'),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(children: [
                InputImage(
                  onSelectedImage: (image) {
                    setState(() {
                      _picture = image
                          .toString()
                          .substring(7, image.toString().length - 1);
                    });
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Form(
                  key: _textFormKey,
                  child: Column(children: [
                    TextFormField(
                        maxLength: 20,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          labelText: "Write employer's name",
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          } else if (value.trim().length <= 1) {
                            return "Please enter a valid name";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _fullName = newValue!;
                        }),
                    TextFormField(
                        maxLength: 20,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          label: const Text(
                            "Write employer's work",
                          ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Work title is required";
                          } else if (value.trim().length <= 1) {
                            return "Please enter a valid work title";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _work = newValue!;
                        }),
                    TextFormField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        label: const Text(
                          "Write employer's age",
                        ),
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Age is required";
                        } else if (int.parse(value) > 110 ||
                            int.parse(value) < 0) {
                          return "Please enter a valid age";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _age = int.parse(newValue!);
                      },
                    ),
                    TextFormField(
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        label: const Text(
                          "Write work importancy",
                        ),
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Importance is required";
                        } else if (int.parse(value) > 10 ||
                            int.parse(value) < 0) {
                          return "Please enter a valid Importance";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _importance = int.parse(newValue!);
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextButton(
                          onPressed: onReset,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondary),
                          ),
                          child: const Text("Reset"),
                        )),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: onSubmit,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondary),
                          ),
                          child: Text("Submit",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white)),
                        ))
                      ],
                    )
                  ]),
                ),
              ])),
            ),
          ),
        ));
  }
}
