import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
log("onChange $change");  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
log("onCreate $bloc");  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
log("onError $bloc $error $stackTrace");  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}