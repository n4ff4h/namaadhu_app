import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:namaadhu_vaguthu/models/island.dart';

import '../models/atoll.dart';

abstract class IIslandsRepository {
  Future<List<Island>> getAllIslands();
  Future<List<Atoll>> getAllAtolls();
}

class IslandsRepository implements IIslandsRepository {
  @override
  Future<List<Island>> getAllIslands() async {
    var content = await rootBundle.loadString("assets/islands.csv");
    List<List<dynamic>> listOfListIslands =
        const CsvToListConverter().convert(content, eol: "\n");

    return listOfListIslands
        .map(
          (value) => Island(
            value[1], // id
            value[2], // atollNumber
            value[3], // islandName
          ),
        )
        .toList();
  }

  @override
  Future<List<Atoll>> getAllAtolls() async {
    var content = await rootBundle.loadString("assets/atolls.csv");
    List<List<dynamic>> listOfListAtolls =
        const CsvToListConverter().convert(content, eol: "\n");
    return listOfListAtolls
        .map(
          (value) => Atoll(
            value[0], // id
            value[1], // atollName
          ),
        )
        .toList();
  }
}
