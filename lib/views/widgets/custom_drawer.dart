import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart' as app_localizations;
import 'package:todo_using_hive/cubits/settings/settings_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: const Color.fromARGB(255, 67, 109, 182),
          child: Column(
            children: [
               DrawerHeader(
                  child: Center(
                      child: Text(
                app_localizations.AppLocalizations.of(context)!.settings,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Text(
                app_localizations.AppLocalizations.of(context)!.theme,
                    style:const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch.adaptive(
                      value: SettingsCubit.get(context).isDark,
                      onChanged: (e) {
                        SettingsCubit.get(context).saveTheme();
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Text(
                app_localizations.AppLocalizations.of(context)!.lang,
                      style:const TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton<Locale>(
                      value: SettingsCubit.get(context).appLang,
                      items:const [
                        DropdownMenuItem<Locale>(
                          value: Locale('en'),
                          child: Text('en'),
                        ),
                        DropdownMenuItem<Locale>(
                          value:  Locale('ar'),
                          child: Text('ar'),
                        )
                      ],
                      onChanged: (e) {
                         SettingsCubit.get(context).saveLang(e!);
                      })
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
