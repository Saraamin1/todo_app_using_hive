import 'package:flutter/material.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/views/widgets/custom_text_form_field.dart';
import 'package:todo_using_hive/views/widgets/dialog_btns.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class EditDialog extends StatefulWidget {
  final TodoModel model;
  const EditDialog({
    super.key, required this.model,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {

  TextEditingController? controller;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    controller!.text=widget.model.title;
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
                  controller: controller!,
                  onChanged: (p0) {
                    
                  },
                  validator: (s) {
                    if (s!.isEmpty) {
                      return AppLocalizations.of(context)!.validator;
                    }
                    // return '';
                  }, hintText: 'Todo',
                ),
                const SizedBox(
                  height: 20,
                ),
                DialogButtons(
                  buttonName:AppLocalizations.of(context)!.edit,
                  onPressed: ()async {
                    if (formKey.currentState!.validate()) {
                     
                  await TodoCubit.get(context).updateData(model:  widget.model,title:  controller!.text);

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
