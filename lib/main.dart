import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/services/data_service.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/services/notification_service.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:namaadhu_vaguthu/shared/utils/prayertimes_utils.dart';
import 'package:namaadhu_vaguthu/shared/utils/string_utils.dart';
import 'package:namaadhu_vaguthu/shared/utils/time_utils.dart';
import 'package:namaadhu_vaguthu/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final islandList = await DataService().getAllIslands();
  final atollList = await DataService().getAllAtolls();

  await NotificationService().initializePlatformNotifications();

  Workmanager().initialize(callbackDispatcher);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        islandsProvider.overrideWithValue(islandList),
        atollsProvider.overrideWithValue(atollList),
      ],
      child: const NamaadhuVaguthuApp(),
    ),
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case prayerTimeShedulerTask:
        NotificationService notificationService = NotificationService();

        await notificationService.initializePlatformNotifications();

        final scheduledNotifications =
            await notificationService.getScheduledNotifications();

        if (scheduledNotifications.isEmpty) {
          final sharedPreferences = await SharedPreferences.getInstance();
          final selectedIslandId = sharedPreferences.getInt('selectedIslandId');
          final prayerTimesList =
              await DataService().getAllPrayerTimes(selectedIslandId!);

          final dayOfYear = TimeUtils().getDayOfYear(DateTime.now());
          final prayerTimesToday = PrayerTimesUtils()
              .getPrayerTimesToday(prayerTimesList, dayOfYear);
          final currentTimeInMinutes =
              DateTime.now().hour * 60 + DateTime.now().minute;

          /* 
            If the current time is greater than isha prayer time,
            then there are no prayer times to be scheduled today.
          */
          if (currentTimeInMinutes < prayerTimesToday.values.last) {
            int id = 0;
            prayerTimesToday.forEach((key, value) async {
              final now = DateTime.now();
              final lastMidnight = DateTime(now.year, now.month, now.day);
              final scheduleTime = lastMidnight.add(Duration(minutes: value));

              final currentTimeInMinutes = now.hour * 60 + now.minute;

              // If the prayer time hasn't passed
              if (value > currentTimeInMinutes) {
                notificationService.createPrayerTimeReminderNotification(
                  id,
                  '${key.capitalizeFirstLetter()} Prayer Time',
                  TimeUtils().durationToString(value),
                  scheduleTime,
                );
                log('${key.capitalizeFirstLetter()} prayer time scheduled');
              }

              id++;
            });
          }
        }
        break;
    }
    return Future.value(true);
  });
}
