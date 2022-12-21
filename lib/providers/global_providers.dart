import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import 'package:namaadhu_vaguthu/services/data_service.dart';
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
    FutureProvider.autoDispose.family<List<PrayerTimes>, int>(
  (ref, id) => ref.watch(dataServiceProvider).getAllPrayerTimes(id),
);