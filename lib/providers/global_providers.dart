import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
  name: 'SharedPreferencesProvider',
);

final islandsProvider =
    Provider<List<Island>>((ref) => throw UnimplementedError());
final atollsProvider =
    Provider<List<Atoll>>((ref) => throw UnimplementedError());
final prayerTimesProvider =
    StateProvider<List<PrayerTimes>>((ref) => throw UnimplementedError());
