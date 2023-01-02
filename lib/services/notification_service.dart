import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  NotificationService();

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initializePlatformNotifications() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Indian/Maldives'));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(initializationSettings);
  }

  Future<NotificationDetails> _notificationDetails() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'scheduled_channel',
      'Prayer Times Reminders',
      groupKey: 'me.naffah.namaadhu_vaguthu',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
    );

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }

  Future<void> createPrayerTimeReminderNotification(
    int id,
    String title,
    String body,
    DateTime scheduleTime,
  ) async {
    final platformChannelSpecifics = await _notificationDetails();

    await _localNotifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleTime, tz.local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    return await _localNotifications.pendingNotificationRequests();
  }

  Future<void> cancelScheduledNotifications() async {
    await _localNotifications.cancelAll();
  }
}
