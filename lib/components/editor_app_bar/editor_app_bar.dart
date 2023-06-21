import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_switcher.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = Provider.of<ThemeSwitcher>(context);

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextButton(
            onPressed: () => {
              // FIXME: #13 open the folder and save the new project
            },
            child: Text(
              'Open folder',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: DropdownButton<AppTheme>(
            value: themeSwitcher.currentThemeOption,
            onChanged: (AppTheme? theme) {
              if (theme != null) {
                themeSwitcher.switchTheme(theme);
              }
            },
            items: AppTheme.values.map((theme) {
              return DropdownMenuItem<AppTheme>(
                value: theme,
                child: Text(theme.toString().split('.').last),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
