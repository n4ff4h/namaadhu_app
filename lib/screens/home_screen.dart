import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/providers/current_time_provider.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:namaadhu_vaguthu/shared/string_utils.dart';
import 'package:namaadhu_vaguthu/shared/time_utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIsland = ref.watch(selectedIslandProvider);
    final prayerTimes = ref.watch(prayerTimesProvider(selectedIsland.id));

    final timeUtils = TimeUtils();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'island_selection');
            },
            icon: const Icon(Ionicons.location),
          ),
        ],
      ),
      body: prayerTimes.when(
        data: (data) {
          final currentTime = ref.watch(currentTimeProvider);

          int dayOfYear = timeUtils.getDayOfYear(currentTime);
          PrayerTimes prayerTimesToday = data.firstWhere(
            (element) => element.id == dayOfYear,
          );

          String? nextPrayerTime;

          final objAsMap = prayerTimesToday.toMap();

          final timeInMinutes = currentTime.hour * 60 + currentTime.minute;
          final keys = objAsMap.keys.toList();

          for (int i = 0; i < keys.length; i++) {
            if (timeInMinutes < objAsMap[keys[i]]!) {
              nextPrayerTime = keys[i];
              break;
            } else {
              nextPrayerTime = keys[0];
            }
          }

          Color setColorForTime(String key) {
            return key == nextPrayerTime ? kPrimaryColor : Colors.white;
          }

          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 32.0),
                  height: 185.0,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEEE MMM dd, yyyy').format(currentTime),
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        '${selectedIsland.atollAbbreviation}. ${selectedIsland.islandName}',
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: objAsMap.entries
                      .map(
                        (element) => ListTile(
                          textColor: setColorForTime(element.key),
                          title: Text(
                            element.key.capitalizeFirstLetter(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          trailing: Text(
                            timeUtils.durationToString(element.value),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                      .toList(),
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
