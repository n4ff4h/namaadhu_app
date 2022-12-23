import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/models/prayer_times.dart';
import '../models/atoll.dart';

abstract class IDataService {
  Future<List<Island>> getAllIslands();
  Future<List<Atoll>> getAllAtolls();
  Future<List<PrayerTimes>> getAllPrayerTimes(int id);
}

final dataServiceProvider = Provider<IDataService>((ref) => DataService());

class DataService implements IDataService {
  @override
  Future<List<Island>> getAllIslands() async {
    var content = await rootBundle.loadString("assets/csv/islands.csv");
    List<List<dynamic>> listOfListIslands =
        const CsvToListConverter().convert(content, eol: "\n");

    List<Atoll> atollList = await getAllAtolls();

    return listOfListIslands.map(
      (value) {
        final atoll = atollList.firstWhere((element) => element.id == value[2]);

        return Island(
          value[1], // id
          value[2], // atollNumber
          atoll.atollAbbreviation,
          value[3], // islandName
        );
      },
    ).toList();
  }

  @override
  Future<List<Atoll>> getAllAtolls() async {
    var content = await rootBundle.loadString("assets/csv/atolls.csv");
    List<List<dynamic>> listOfListAtolls =
        const CsvToListConverter().convert(content, eol: "\n");
    return listOfListAtolls
        .map(
          (value) => Atoll(
            value[0], // id
            value[1], // atollName
            value[2], // atollAbbreviation
          ),
        )
        .toList();
  }

  @override
  Future<List<PrayerTimes>> getAllPrayerTimes(int id) async {
    var content = await rootBundle.loadString("assets/csv/islands/$id.csv");
    List<List<dynamic>> listOfListPrayerTimes =
        const CsvToListConverter().convert(content, eol: "\n");

    return listOfListPrayerTimes
        .map(
          (value) => PrayerTimes(
            value[0], // id
            value[1], // fajr
            value[2], // sunrise
            value[3], // dhuhr
            value[4], // asr
            value[5], // maghrib
            value[6], // isha
          ),
        )
        .toList();
  }
}
