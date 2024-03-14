import 'package:flutter/material.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/views/widgets/custom_list_tile.dart';

class TodoItem extends StatelessWidget {
    final TodoModel model;
final Function() deletButton;
  const TodoItem({
    super.key, required this.model, required this.deletButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            spreadRadius: 5,
            offset:const Offset(5, 10),
            blurRadius: 3,
          )
        ],
        gradient:const LinearGradient(colors: [Colors.blue, Color.fromARGB(255, 163, 196, 252)]),
        border: Border.all(color: Colors.grey),
      ),
      child:  CustomListTile(model: model, deletButton: deletButton,),
    );
  }
}

