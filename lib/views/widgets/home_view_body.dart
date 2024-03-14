import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_hive/cubits/todoo/todo_cubit.dart';
import 'package:todo_using_hive/views/widgets/custom_text_form_field.dart';
import 'package:todo_using_hive/views/widgets/search_list.dart';
import 'package:todo_using_hive/views/widgets/todo_list.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
   String q='';
      TextEditingController? controller;
    @override
      void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<TodoCubit, TodoState >(
        builder: (context, state) {
          
         
      
          return  SingleChildScrollView(
            child: Column(  
              children: [  
                CustomTextFormField(controller: controller!, validator: (s) {  },onChanged: (v) {
                  setState(() {
                    q=v;
 TodoCubit.get(context).search(v);

                  });
                   
                },borderRadius: 30, hintText: AppLocalizations.of(context)!.search,),
              const  SizedBox(height: 30,),
             
             q.isEmpty?  const  TodoList()
              : const  SearchList(),
              if(TodoCubit.get(context).todo!.isEmpty )
              SizedBox(
                      height:MediaQuery.of(context).size.height*.5,
                      child:   Align(alignment: Alignment.center,child: Text( AppLocalizations.of(context)!.addTask,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),))),


                 
                      

              ],    
            ),
          ); 
        
        },
      ),
    );
  }
}

