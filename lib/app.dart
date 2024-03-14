
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart' as app_localizations;
import 'package:todo_using_hive/cubits/settings/settings_cubit.dart';
import 'package:todo_using_hive/core/utiles/theme.dart';
import 'package:todo_using_hive/views/home_view.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates:app_localizations.AppLocalizations.localizationsDelegates,
          supportedLocales: app_localizations.AppLocalizations.supportedLocales,
          locale:SettingsCubit.get(context).appLang,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: SettingsCubit.get(context).toggleTheme(),
          home: const HomeView(),
        );
      },
    );
  }
}

class AppLocalizations {
}
