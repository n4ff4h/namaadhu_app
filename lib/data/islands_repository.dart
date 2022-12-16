import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:namaadhu_vaguthu/models/island.dart';

abstract class IIslandsRepository {
  Future<List<Island>> getAll();
  Future<Island> getOne();
}

class IslandsRepository implements IIslandsRepository {
  @override
  Future<List<Island>> getAll() async {
    var content = await rootBundle.loadString("assets/islands.csv");
    List<List<dynamic>> listOfList =
        const CsvToListConverter().convert(content, eol: "\n");
    return listOfList
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
  Future<Island> getOne() async {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
