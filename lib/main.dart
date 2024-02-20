import 'package:final_lab/core/services/injection_container.dart';
import 'package:final_lab/features/delete_item_provider.dart';
import 'package:final_lab/features/theme/app_theme.dart';
import 'package:final_lab/features/theme/theme_provider.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:final_lab/source/features/employer_list/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: FinalLab()));
}

class FinalLab extends StatelessWidget {
  const FinalLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DeleteItemProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          theme: AppThemeData.lightTheme(),
          darkTheme: AppThemeData.darkTheme(),
          themeMode: theme.currentTheme,
          home: BlocProvider<EmployerBloc>(
            create: (context) => sl<EmployerBloc>(),
            child: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}
