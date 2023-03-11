import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:namaadhu_app/src/features/home/providers/current_time_provider.dart';
import 'package:namaadhu_app/src/features/home/providers/global_providers.dart';
import 'package:namaadhu_app/src/features/home/providers/selected_island_provider.dart';
import 'package:namaadhu_app/src/constants/app_colors.dart';
import 'package:namaadhu_app/src/utils/prayertimes_utils.dart';
import 'package:namaadhu_app/src/utils/string_utils.dart';
import 'package:namaadhu_app/src/utils/time_utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIsland = ref.watch(selectedIslandProvider);
    final prayerTimes = ref.watch(prayerTimesProvider(selectedIsland.id));

    final timeUtils = TimeUtils();
    final prayerTimeUtils = PrayerTimesUtils();

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

          // Get the prayer times for today as a Map
          int dayOfYear = timeUtils.getDayOfYear(currentTime);
          Map<String, dynamic> prayerTimesToday =
              prayerTimeUtils.getPrayerTimesToday(data, dayOfYear);

          // Use the current time in minutes to get the next prayer time in the Map
          final currentTimeInMinutes =
              currentTime.hour * 60 + currentTime.minute;
          String? nextPrayerTime = prayerTimeUtils.getNextPrayerTime(
              prayerTimesToday, currentTimeInMinutes);

          Color highlightNextPrayerTime(String key) {
            return key == nextPrayerTime ? kPrimaryColor : Colors.white;
          }

          return Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
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
                  children: prayerTimesToday.entries
                      .map(
                        (element) => ListTile(
                          textColor: highlightNextPrayerTime(element.key),
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
