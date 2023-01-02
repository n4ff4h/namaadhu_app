import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/services/data_service.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';
import 'package:namaadhu_vaguthu/services/notification_service.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:namaadhu_vaguthu/shared/theme.dart';
import 'package:namaadhu_vaguthu/shared/utils/prayertimes_utils.dart';
import 'package:namaadhu_vaguthu/shared/utils/string_utils.dart';
import 'package:namaadhu_vaguthu/shared/utils/time_utils.dart';
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
