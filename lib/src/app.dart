import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_app/src/features/select_island/providers/selected_island_provider.dart';
import 'package:namaadhu_app/src/features/home/screens/home_screen.dart';
import 'package:namaadhu_app/src/features/select_island/screens/island_selection_screen.dart';
import 'package:namaadhu_app/src/constants/app_colors.dart';
import 'package:namaadhu_app/src/constants/theme.dart';

class NamaadhuApp extends ConsumerWidget {
  const NamaadhuApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIsland = ref.watch(selectedIslandProvider);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kBackgroundColor,
        systemNavigationBarColor: kBackgroundColor,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      // -1 == value being null in state notifier class
      initialRoute: selectedIsland.id != -1 ? 'home' : 'island_selection',
      routes: {
        'home': (context) => const HomeScreen(),
        'island_selection': (context) => const IslandSelectionScreen(),
      },
    );
  }
}
