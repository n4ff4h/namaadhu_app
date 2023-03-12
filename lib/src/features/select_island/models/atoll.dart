import 'package:flutter_riverpod/flutter_riverpod.dart';

final atollsProvider =
    Provider<List<Atoll>>((ref) => throw UnimplementedError());

class Atoll {
  final int id;
  final String atollName;
  final String atollAbbreviation;

  Atoll(this.id, this.atollName, this.atollAbbreviation);
}
