import 'package:hive/hive.dart';
// part 'todo_model.g.dart';
// @HiveType(typeId: 0)
class TodoModel extends HiveObject{
  // @HiveField(0)
   String title;
   bool isCompleted;

  TodoModel({required this.title,required this.isCompleted});

}