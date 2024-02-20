import 'package:final_lab/core/widgets/app_bar.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/add_button.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/delete_icon_button.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/group_view.dart';
import 'package:final_lab/source/features/employer_list/presentation/widgets/theme_change_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Group> groups = [
  const Group(groupName: 'Hi', color: 'x/ffff', employers: []),
  const Group(groupName: 'hoi', color: 'x/ffff', employers: []),
  const Group(groupName: 'hei', color: '0xFF42A5F5', employers: [])
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _loadGroups() {
    context.read<EmployerBloc>().add(GetGroupsEvent());
  }

  @override
  void initState() {
    super.initState();
    //Hive.box(boxName).clear();
    _loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(
        title: 'Groups',
        actions: [DeleteIcon(), ThemeIcon()],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<EmployerBloc, GroupState>(
              listener: (context, state) {
                if (state is GroupAddDecline) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: Theme.of(context).primaryColorLight,
                      content: Text(
                        'The same group already existing!',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      )));
                }
              },
              builder: (context, state) {
                return state is GroupEmpty
                    ? Center(
                        child: Text(
                          'No groups for now',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : state is GroupsLoaded
                        ? GridView.builder(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.01,
                                    crossAxisSpacing:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                            itemCount: state.groups.length,
                            itemBuilder: (context, index) {
                              bool defaultColor;
                              Color(int.parse(state.groups[index].color)) ==
                                      const Color(0xFF42A5F5)
                                  ? defaultColor = true
                                  : defaultColor = false;
                              return GroupItem(
                                  index: index,
                                  colorDeafult: defaultColor,
                                  group: state.groups[index]);
                            })
                        : state is LocalDbError
                            ? Center(
                                child: Text(
                                  state.errorMessage,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              )
                            : Center(
                                child: Text(
                                'Something went wrong',
                                style: Theme.of(context).textTheme.titleMedium,
                              ));
              },
            ),
          ),

          AddButton(event: AddGroupEvent(group: groups[2])),
          // GestureDetector(
          //     child: Container(
          //       height: MediaQuery.of(context).size.height * 0.06,
          //       decoration: BoxDecoration(
          //           color: Theme.of(context).primaryColorLight,
          //           border: Border(
          //               top: BorderSide(
          //                   width: 2,
          //                   color: Theme.of(context).primaryColorDark))),
          //       child: Center(
          //           child: Text(
          //         'Add group',
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleMedium!
          //             .copyWith(color: Colors.white),
          //       )),
          //     ),
          //     onTap: () {
          //       context
          //           .read<EmployerBloc>()
          //           .add(AddGroupEvent(group: groups[2]));
          //     }),
        ],
      ),
    );
  }
}
