part of 'todo_cubit.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}
class SucessGetData extends TodoState{
  final List<dynamic> model;

  SucessGetData({required this.model});
}
class SucessAddData extends TodoState{}

class SucessDeleteData extends TodoState{}
class LoadingDeleteData extends TodoState{}
class FailedDeleteData extends TodoState{}

class SucessUpdateData extends TodoState{}
class LoadingUpdataData extends TodoState{}
class FailedUpdateData extends TodoState{}

class SucessUpdateChechBox extends TodoState{}
class LoadingUpdataChechBox extends TodoState{}
class FailedUpdateChechBox extends TodoState{}
class SucessClearData extends TodoState{}
class LoadingClearData extends TodoState{}
class FailedClearData extends TodoState{}

class SucessSearch extends TodoState{}
class LoadingSearch extends TodoState{}
class FailedSearch extends TodoState{}