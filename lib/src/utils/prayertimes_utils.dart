import 'package:namaadhu_vaguthu/src/features/home/models/prayer_times.dart';

class PrayerTimesUtils {
  Map<String, dynamic> getPrayerTimesToday(
    List<PrayerTimes> prayerTimesList,
    int dayOfYear,
  ) {
    return prayerTimesList
        .firstWhere(
          (element) => element.id == dayOfYear,
        )
        .toMap();
  }

  String? getNextPrayerTime(
    Map<String, dynamic> prayerTimesToday,
    int currentTimeInMinutes,
  ) {
    List keys = prayerTimesToday.keys.toList();
    String? nextPrayerTime;

    for (int i = 0; i < keys.length; i++) {
      if (currentTimeInMinutes < prayerTimesToday[keys[i]]!) {
        nextPrayerTime = keys[i];
        break;
      } else {
        nextPrayerTime = keys[0];
      }
    }

    return nextPrayerTime;
  }
}
