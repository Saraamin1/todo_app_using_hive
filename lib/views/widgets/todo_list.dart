import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/views/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({ 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<TodoCubit, TodoState >(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return TodoItem(
              model:
         TodoCubit.get(context).todo![i], 
deletButton: ()async { 
           await     TodoCubit.get(context).deletData(
             TodoCubit.get(context).todo![i],
             );
        
               },  
            ); 
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 25),
          itemCount:  TodoCubit.get(context).todo!.length ,
        ); 
      },
    ); 
  }
}
