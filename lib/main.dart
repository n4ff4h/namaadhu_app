import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/services/data_service.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final islandList = await DataService().getAllIslands();
  final atollList = await DataService().getAllAtolls();

  final islandId = sharedPreferences.getInt('selectedIslandId');
  final List<PrayerTimes> prayerTimesList;
  prayerTimesList =
      islandId != null ? await DataService().getAllPrayerTimes(islandId) : [];

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        islandsProvider.overrideWithValue(islandList),
        atollsProvider.overrideWithValue(atollList),
        prayerTimesProvider.overrideWith((ref) => prayerTimesList),
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
      // -1 check == value being null in state notifier class
      initialRoute:
          ref.read(selectedIslandProvider) != -1 ? '/' : 'island_selection',
      routes: {
        '/': (context) => const HomeScreen(),
        '/island_selection': (context) => const IslandSelectionScreen(),
      },
    );
  }
}
