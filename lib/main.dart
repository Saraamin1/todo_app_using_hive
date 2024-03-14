import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_using_hive/app.dart';
import 'package:todo_using_hive/cubits/settings/settings_cubit.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/models/todo_model_type_adapter.dart';
import 'package:todo_using_hive/core/utiles/bloc_observer.dart';
import 'package:todo_using_hive/core/utiles/constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelTypeAdapter());
  await Hive.openBox<TodoModel>(kBoxName);
  await Hive.openBox('settings');

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SettingsCubit()..getTheme()..getLang(),
      ),
      BlocProvider(
        create: (context) => TodoCubit()..getData(),
      ),
    ],
    child: const MyApp(),
  ));
}

