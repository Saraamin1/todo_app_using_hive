import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(ThemeInitial());
  static SettingsCubit get(context)=>BlocProvider.of(context);
  Box themebox=Hive.box('settings');
  bool isDark=false;
  toggleTheme(){
    return isDark==false?ThemeMode.light:ThemeMode.dark;
  }
  getTheme(){
isDark=themebox.get('isDark',defaultValue: isDark);
emit(GetTheme());

return isDark;
  }
  saveTheme()async{
    isDark= !isDark;
   await themebox.put('isDark', isDark);
   emit(SaveTheme());

  }
Locale appLang=const Locale('en');
saveLang(Locale v)async{
  appLang=v;
  await themebox.put('theme', appLang.languageCode);
  // getLang();
  print(appLang.languageCode);
  emit(SaveLang());


}
getLang()async{
  // themebox.delete('theme');
  appLang=Locale(themebox.get('theme',)??'en');
    print(appLang.languageCode);

emit(GetLang());
}
}
