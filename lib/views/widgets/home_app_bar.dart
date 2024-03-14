import 'package:flutter/material.dart';

import 'package:todo_using_hive/core/utiles/functions.dart';
import 'package:todo_using_hive/views/widgets/delete_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
AppBar homeAppBar(context) {
  return AppBar(
   
    actions: [
     
           IconButton(
              onPressed: () {
                dialogShown(context,const DeleteDialog());
              },
              icon: const Icon(Icons.delete)),
        
    ],
    title:  Text(
      AppLocalizations.of(context)!.todo,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue),
    ),
    centerTitle: true,
  );
}
