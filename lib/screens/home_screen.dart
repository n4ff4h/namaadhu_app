import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayerTimes = ref.watch(prayerTimesProvider);

    int dayOfYear = int.parse(DateFormat("D").format(DateTime.now()));
    PrayerTimes prayerTimesToday = prayerTimes.firstWhere(
      (element) => element.id == dayOfYear,
    );

    String durationToString(int minutes) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'island_selection');
            },
            icon: const Icon(Icons.location_on),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text('Fajr'),
              trailing: Text(durationToString(prayerTimesToday.fajr)),
            ),
            ListTile(
              title: const Text('Sunrise'),
              trailing: Text(durationToString(prayerTimesToday.sunrise)),
            ),
            ListTile(
              title: const Text('Dhuhr'),
              trailing: Text(durationToString(prayerTimesToday.dhuhr)),
            ),
            ListTile(
              title: const Text('Asr'),
              trailing: Text(durationToString(prayerTimesToday.asr)),
            ),
            ListTile(
              title: const Text('Maghrib'),
              trailing: Text(durationToString(prayerTimesToday.maghrib)),
            ),
            ListTile(
              title: const Text('Isha'),
              trailing: Text(durationToString(prayerTimesToday.isha)),
            ),
          ],
        ),
      ),
    );
  }
}
