part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class ThemeInitial extends SettingsState {}
 class Toggle extends SettingsState {}
  class SaveTheme extends SettingsState {}
 class GetTheme extends SettingsState {}

   class SaveLang extends SettingsState {}
 class GetLang extends SettingsState {}


