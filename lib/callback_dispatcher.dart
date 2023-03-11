import 'dart:developer';

import 'package:namaadhu_app/src/constants/constants.dart';
import 'package:namaadhu_app/src/features/home/services/data_service.dart';
import 'package:namaadhu_app/src/features/home/services/notification_service.dart';
import 'package:namaadhu_app/src/utils/prayertimes_utils.dart';
import 'package:namaadhu_app/src/utils/string_utils.dart';
import 'package:namaadhu_app/src/utils/time_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

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
