import 'package:final_lab/core/constants/box_name.dart';
import 'package:final_lab/source/features/employer_list/data/local_data_source/ilocal_data_source.dart';
import 'package:final_lab/source/features/employer_list/data/local_data_source/local_data_source.dart';
import 'package:final_lab/source/features/employer_list/data/repositories/repo_impl.dart';
import 'package:final_lab/source/features/employer_list/domain/repositories/local_repo.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/add_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/delete_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/edit_usecase.dart';
import 'package:final_lab/source/features/employer_list/domain/usecases/get_usecase.dart';
import 'package:final_lab/source/features/employer_list/presentation/bloc/employer_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*register local db
  await Hive.initFlutter();
  final box = await Hive.openBox(boxName);
  sl.registerSingleton<Box>(box);

  //*data sources
  sl.registerSingleton<ILocalDataSource>(LocalDataSource(box: sl()));

  //*repo's
  sl.registerSingleton<ILocalRepo>(LocalRepoImpl(source: sl()));

  //*use cases
  sl.registerSingleton<GetEmployers>(GetEmployers(repo: sl()));
  sl.registerSingleton<AddEmployer>(AddEmployer(repo: sl()));
  sl.registerSingleton<DeleteEmployer>(DeleteEmployer(repo: sl()));
  sl.registerSingleton<EditEmployer>(EditEmployer(repo: sl()));

  //*bloc
  sl.registerFactory<EmployerBloc>(() => EmployerBloc(
      addEmployer: sl(),
      deleteEmployer: sl(),
      editEmployer: sl(),
      getEmployers: sl()));
}
