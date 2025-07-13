// lib/features/settings/widgets/dark_mode_toggle.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/theme/theme_notifier.dart';

class DarkModeToggle extends ConsumerWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: themeMode == ThemeMode.dark,
        onChanged: (bool value) {
          ref.read(themeModeProvider.notifier).state = value
              ? ThemeMode.dark
              : ThemeMode.light;
        },
      ),
    );
  }
}
