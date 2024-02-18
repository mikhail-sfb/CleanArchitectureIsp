import 'package:final_lab/features/theme/theme_provider.dart';
import 'package:final_lab/source/features/employer_list/domain/entities/employer.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

const List<String> names = ['john', 'majohn', 'mimamamomu'];
List<Employer> employers = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _loadEmployers() {
    context.read<EmployerBloc>().add(GetEmployersEvent());
  }

  @override
  void initState() {
    super.initState();
    _loadEmployers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        actions: [IconButton(onPressed: (){
          Provider.of<ThemeProvider>(context, listen: false).switchTheme();
        }, icon: const Icon(Icons.sunny))],
      ),
      body: Column(
        children: [
          BlocBuilder<EmployerBloc, EmployerState>(
            builder: (context, state) => state is EmployersLoaded
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.employers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.employers[index].fullName),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text('Bruh'),
                  ),
          ),
          TextButton(
            onPressed: () {
              Employer maks = Employer(
                  age: 12, importance: 0, work: 'c--', fullName: 'mamakisik');
              context
                  .read<EmployerBloc>()
                  .add(AddEmployerEvent(employer: maks));
            },
            child: const Text('Add maks'),
          )
        ],
      ),
    );
  }
}
