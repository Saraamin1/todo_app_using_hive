import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/core/utiles/functions.dart';
import 'package:todo_using_hive/views/widgets/add_dialog.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            dialogShown(context,const  AddDialog(),);
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
