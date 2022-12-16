import 'package:flutter/material.dart';
import 'package:namaadhu_vaguthu/data/islands_repository.dart';
import 'package:namaadhu_vaguthu/screens/home_screen.dart';
import 'package:namaadhu_vaguthu/screens/island_selection_screen.dart';

void main() {
  runApp(const NamaadhuVaguthuApp());
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
