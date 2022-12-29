import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static Future<void> createPrayerTimeReminderNotification(
    int id,
    String title,
    String body,
    DateTime scheduleTime,
  ) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'reminder_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
      ),
      schedule: NotificationCalendar.fromDate(
        date: scheduleTime,
        allowWhileIdle: true,
        preciseAlarm: true,
      ),
    );
  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
