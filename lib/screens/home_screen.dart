import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIslandId = ref.watch(selectedIslandProvider);
    final prayerTimes = ref.watch(prayerTimesProvider(selectedIslandId));

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
      body: prayerTimes.when(
        data: (data) {
          int dayOfYear = int.parse(DateFormat("D").format(DateTime.now()));
          PrayerTimes prayerTimesToday = data.firstWhere(
            (element) => element.id == dayOfYear,
          );

          int? nextPrayerTime;

          final listAsMap = prayerTimesToday.toJson();

          listAsMap.forEach((key, value) {
            final now = DateTime.now();
            final timeInMinutes = now.hour * 60 + now.minute;
            if (timeInMinutes >= value) {
              nextPrayerTime = (key == 6) ? key = 1 : key + 1;
              return;
            }
          });

          Color setColorForTime(int key) {
            return key == nextPrayerTime ? Colors.blue : Colors.black;
          }

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  textColor: setColorForTime(1),
                  title: const Text('Fajr'),
                  trailing: Text(durationToString(prayerTimesToday.fajr)),
                ),
                ListTile(
                  textColor: setColorForTime(2),
                  title: const Text('Sunrise'),
                  trailing: Text(durationToString(prayerTimesToday.sunrise)),
                ),
                ListTile(
                  textColor: setColorForTime(3),
                  title: const Text('Dhuhr'),
                  trailing: Text(durationToString(prayerTimesToday.dhuhr)),
                ),
                ListTile(
                  textColor: setColorForTime(4),
                  title: const Text('Asr'),
                  trailing: Text(durationToString(prayerTimesToday.asr)),
                ),
                ListTile(
                  textColor: setColorForTime(5),
                  title: const Text('Maghrib'),
                  trailing: Text(durationToString(prayerTimesToday.maghrib)),
                ),
                ListTile(
                  textColor: setColorForTime(6),
                  title: const Text('Isha'),
                  trailing: Text(durationToString(prayerTimesToday.isha)),
                ),
              ],
            ),
          );
        },
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
