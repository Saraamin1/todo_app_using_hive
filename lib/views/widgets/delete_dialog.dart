import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/views/widgets/dialog_btns.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Dialog(
          child: SizedBox(
            height: 200,
            width: 100, 
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                  AppLocalizations.of(context)!.clear,
                    style: const TextStyle(fontSize: 20),textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DialogButtons(
                    buttonName: AppLocalizations.of(context)!.ok,
                    onPressed: () async {
                      TodoCubit.get(context).clearData();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
