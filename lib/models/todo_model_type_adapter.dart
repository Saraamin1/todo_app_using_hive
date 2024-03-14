import 'package:hive_flutter/adapters.dart';
import 'package:todo_using_hive/models/todo_model.dart';

class TodoModelTypeAdapter implements TypeAdapter<TodoModel>{
  @override
  read(BinaryReader reader) {
    return TodoModel(title: reader.readString(), isCompleted: reader.readBool());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer,TodoModel obj) {
    writer.writeString(obj.title);
writer.writeBool(obj.isCompleted) ;
 }
}