import 'package:final_lab/features/theme/theme_provider.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/group.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

List<Group> groups = [
  const Group(groupName: 'Hi', color: 'x/ffff', employers: []),
  const Group(groupName: 'hoi', color: 'x/ffff', employers: []),
  const Group(groupName: 'hei', color: 'x/ffff', employers: [])
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
    _loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .switchTheme();
              },
              icon: const Icon(Icons.sunny))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<EmployerBloc, GroupState>(
              builder: (context, state) {
                return state is GroupEmpty
                    ? const Center(
                        child: Text(
                          'Empty',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : state is GroupsLoaded
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: state.groups.length,
                            itemBuilder: (context, index) => Container(
                              color: Colors.black,
                              child: const Center(child: Text('created')),
                            ),
                          )
                        : const Center(
                            child: Text('wrong'),
                          );
              },
            ),
          ),
          TextButton(
              child: const Text('dummy add'),
              onPressed: () {
                context
                    .read<EmployerBloc>()
                    .add(AddGroupEvent(group: groups[2]));
              }),
        ],
      ),
    );
  }
}
