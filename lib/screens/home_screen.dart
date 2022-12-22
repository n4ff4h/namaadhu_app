import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/providers/current_time_provider.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIslandId = ref.watch(selectedIslandProvider);
    final prayerTimes = ref.watch(prayerTimesProvider(selectedIslandId));

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
          final currentTime = ref.watch(currentTimeProvider);

          int dayOfYear = int.parse(DateFormat("D").format(currentTime));
          PrayerTimes prayerTimesToday = data.firstWhere(
            (element) => element.id == dayOfYear,
          );

          String? nextPrayerTime;

          final objAsMap = prayerTimesToday.toMap();

          // objAsMap.forEach((key, value) {
          //   final timeInMinutes = currentTime.hour * 60 + currentTime.minute;
          //   if (timeInMinutes >= value) {
          //     int index = objAsMap.keys.toList().indexOf(key);
          //     nextPrayerTime = (index == 5)
          //         ? objAsMap.keys.elementAt(index = 1)
          //         : objAsMap.keys.elementAt(index++);
          //     return;
          //   }
          // });

          final timeInMinutes = currentTime.hour * 60 + currentTime.minute;
          final keys = objAsMap.keys.toList();

          for (int i = 0; i < keys.length; i++) {
            if (timeInMinutes < objAsMap[keys[i]]!) {
              nextPrayerTime = keys[i];
              break;
            }
          }

          Color setColorForTime(String key) {
            return key == nextPrayerTime ? kPrimaryColor : Colors.white;
          }

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                        durationToString(element.value),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}
