import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_using_hive/models/todo_model.dart';
import 'package:todo_using_hive/core/utiles/constants.dart';

part 'todo_state.dart';
class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
static TodoCubit get(context)=>BlocProvider.of<TodoCubit>(context);
  Box todoBox=Hive.box<TodoModel>(kBoxName);
   List<TodoModel>? todo;
      List<TodoModel>? searchQuery=[];

  getData(){
    log(todoBox.values.length.toString());
       todo=  todoBox.values.toList() as List<TodoModel>;

    emit( SucessGetData(model:todo!));
  
  }
  addData(TodoModel model)async{
   await todoBox.add(model); 
   await getData();
   emit(SucessAddData());
  }
deletData(
  TodoModel model
  )async{
  emit(LoadingDeleteData());
  try {
 await model.delete();
    await getData();

 emit(SucessDeleteData());

  } catch (e) {
    log(e.toString());
    emit(FailedDeleteData());
  }
 
}
updateData({required TodoModel model,required String title}){
 
model.title =title;
 model.save().then((value){
      getData();

emit(SucessUpdateData());

}).catchError((e){
    emit(FailedUpdateData());

});




}
updateCheckBox({required TodoModel model,required bool isCompleted}){
  
model.isCompleted =isCompleted;
 model.save().then((value){
      getData();

emit(SucessUpdateChechBox());

}).catchError((e){
    emit(FailedUpdateChechBox());

});}
clearData()async{
  
  
  emit(LoadingClearData());
  try {
   await todoBox.clear();
         getData();


 emit(SucessClearData());

  } catch (e) {
    log(e.toString());
    emit(FailedClearData());
  
 
}
}
search(String q){

searchQuery=todo!.where((element) {
 return element.title.toLowerCase().contains(q.toLowerCase());
 
}).toList();
emit(SucessSearch());
}
}
