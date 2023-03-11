import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/src/features/home/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/src/features/home/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/src/features/home/screens/island_selection_screen.dart';
import 'package:namaadhu_vaguthu/src/constants/constants.dart';
import 'package:namaadhu_vaguthu/src/constants/theme.dart';

class NamaadhuVaguthuApp extends ConsumerWidget {
  const NamaadhuVaguthuApp({super.key});

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
