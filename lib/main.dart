import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/services/data_service.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:namaadhu_vaguthu/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final islandList = await DataService().getAllIslands();
  final atollList = await DataService().getAllAtolls();

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'reminder_channel',
        channelName: 'Reminder Notifications',
        channelDescription: 'Alert user on prayer times',
        defaultColor: kPrimaryColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      )
    ],
  );

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

class NamaadhuVaguthuApp extends ConsumerStatefulWidget {
  const NamaadhuVaguthuApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NamaadhuVaguthuAppState();
}

class _NamaadhuVaguthuAppState extends ConsumerState<NamaadhuVaguthuApp> {
  @override
  void initState() {
    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'reminder_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
