import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_hive/cubits/settings/settings_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final double borderRadius;
  final String? Function(String?)? validator;
    final String hintText;

   Function(String)? onChanged;
   CustomTextFormField({
    super.key, required this.controller,required this.validator, this.onChanged,this.borderRadius=0, required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged! ,
      validator:validator ,
      controller:controller ,
      decoration:  InputDecoration(
        contentPadding: BlocProvider.of<SettingsCubit>(context).appLang==const Locale('ar')? const EdgeInsets.only(right: 50):const EdgeInsets.only(left: 50),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        hintText: hintText,
      ),
    );
  }
}

