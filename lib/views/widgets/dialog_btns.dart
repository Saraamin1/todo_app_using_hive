import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:todo_using_hive/views/widgets/custom_btn.dart';

class DialogButtons extends StatelessWidget {
  final String buttonName;
  final Function() onPressed;
  const DialogButtons({
    super.key,
     required this.buttonName, required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          text: buttonName,
          onPressed: onPressed,
        ),
        CustomButton(
          text:  AppLocalizations.of(context)!.cancel,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}