import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/data/islands_repository.dart';
import 'package:namaadhu_vaguthu/models/island.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<Island>? csvData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          csvData = await IslandsRepository().getAllIslands();
          if (kDebugMode) {
            print(csvData!.length);
          }
        },
      ),
    );
  }
}
