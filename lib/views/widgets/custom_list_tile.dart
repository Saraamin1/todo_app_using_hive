import 'package:flutter/material.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/core/utiles/functions.dart';
import 'package:todo_using_hive/views/widgets/edit_dialog.dart';

class CustomListTile extends StatelessWidget {
  final TodoModel model;
  final Function() deletButton;
  const CustomListTile({
    super.key, required this.model, required this.deletButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: SizedBox(
    width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              dialogShown(context, EditDialog(model: model,)); 
            }, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: deletButton, icon: const Icon(Icons.delete)),
         
          ],
        ), 
      ), 
      textColor: Colors.black,
      title:  Text(model.title,style: TextStyle(decoration: model.isCompleted== true?TextDecoration.lineThrough:TextDecoration.none ,),),
      leading: Checkbox( 
        activeColor: Colors.black54,
                value: model.isCompleted, 
                onChanged: (e) {
                  TodoCubit.get(context).updateCheckBox(model: model,isCompleted: e!);
                },
                )
       
     
    );
  }
}
