import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/core/utiles/constants.dart';
import 'package:todo_using_hive/views/widgets/custom_text_form_field.dart';
import 'package:todo_using_hive/views/widgets/dialog_btns.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({
    super.key,
  });

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  Box todoBox = Hive.box<TodoModel>(kBoxName);

  TextEditingController? controller;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  AppLocalizations.of(context)!.addQuestion,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: (e){},
                  controller: controller!,
                  validator: (s) {
                    if (s!.isEmpty) {
                      return AppLocalizations.of(context)!.validator;
                    }
                  }, hintText: 'Todo',
                ),
                const SizedBox(
                  height: 20,
                ),
                DialogButtons(
                  buttonName: AppLocalizations.of(context)!.add,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TodoModel todoModel =
                          TodoModel(title: controller!.text, isCompleted: false);
                   TodoCubit.get(context).addData(todoModel);

                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
