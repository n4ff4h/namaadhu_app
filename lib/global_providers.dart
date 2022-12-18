import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
  name: 'SharedPreferencesProvider',
);

final islandsProvider =
    Provider<Future<List<Island>>>((ref) => throw UnimplementedError());
final atollsProvider =
    Provider<Future<List<Atoll>>>((ref) => throw UnimplementedError());
