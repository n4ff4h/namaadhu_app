import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/data/islands_repository.dart';
import 'package:namaadhu_vaguthu/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        islandsProvider
            .overrideWith((ref) => IslandsRepository().getAllIslands()),
        atollsProvider
            .overrideWith((ref) => IslandsRepository().getAllAtolls()),
      ],
      child: const NamaadhuVaguthuApp(),
    ),
  );
}

class NamaadhuVaguthuApp extends ConsumerWidget {
  const NamaadhuVaguthuApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          ref.read(selectedIslandProvider) != -1 ? '/' : 'island_selection',
      routes: {
        '/': (context) => const HomeScreen(),
        '/island_selection': (context) => const IslandSelectionScreen(),
      },
    );
  }
}
