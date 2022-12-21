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

  Map<int, dynamic> toJson() => {
        0: id,
        1: fajr,
        2: sunrise,
        3: dhuhr,
        4: asr,
        5: maghrib,
        6: isha,
      };
}
