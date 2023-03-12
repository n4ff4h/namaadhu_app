import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_app/src/services/data_service.dart';

final prayerTimesProvider =
    FutureProvider.autoDispose.family<List<PrayerTimes>, int>(
  (ref, id) => ref.watch(dataServiceProvider).getAllPrayerTimes(id),
);

class PrayerTimes {
  final int id;
  final int fajr;
  final int sunrise;
  final int dhuhr;
  final int asr;
  final int maghrib;
  final int isha;

  PrayerTimes(
    this.id,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  );

  Map<String, int> toMap() => {
        'fajr': fajr,
        'sunrise': sunrise,
        'dhuhr': dhuhr,
        'asr': asr,
        'maghrib': maghrib,
        'isha': isha,
      };
}
