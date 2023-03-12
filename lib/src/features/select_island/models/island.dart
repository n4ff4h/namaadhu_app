import 'package:flutter_riverpod/flutter_riverpod.dart';

final islandsProvider =
    Provider<List<Island>>((ref) => throw UnimplementedError());

class Island {
  final int id;
  final int atollNumber;
  final String atollAbbreviation;
  final String islandName;

  Island(this.id, this.atollNumber, this.atollAbbreviation, this.islandName);
}
