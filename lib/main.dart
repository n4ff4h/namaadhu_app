import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/data/islands_repository.dart';
import 'package:namaadhu_vaguthu/global_providers.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        islandsProvider
            .overrideWith((ref) => IslandsRepository().getAllIslands()),
        atollsProvider
            .overrideWith((ref) => IslandsRepository().getAllAtolls()),
      ],
      child: const NamaadhuVaguthuApp(),
    ),
  );
}

class NamaadhuVaguthuApp extends StatelessWidget {
  const NamaadhuVaguthuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IslandSelectionScreen(),
    );
  }
}
