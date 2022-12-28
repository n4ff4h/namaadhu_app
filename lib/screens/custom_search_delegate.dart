import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Island> islandList;
  final List<Atoll> atollList;

  CustomSearchDelegate(this.islandList, this.atollList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Ionicons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Ionicons.chevron_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildListTiles(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildListTiles(context);
  }

  Widget buildListTiles(BuildContext context) {
    List<Island> matchQuery = [];

    for (var island in islandList) {
      final queryLC = query.toLowerCase();
      final islandNameLC =
          '${island.atollAbbreviation}. ${island.islandName}'.toLowerCase();

      if (islandNameLC.contains(queryLC)) {
        matchQuery.add(island);
      }
    }

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var island = matchQuery[index];

            return ListTile(
              onTap: () {
                final selectedIslandNotifier =
                    ref.watch(selectedIslandProvider.notifier);

                selectedIslandNotifier.setSelectedIsland(
                  id: island.id,
                  atollAbbreviation: island.atollAbbreviation,
                  islandName: island.islandName,
                );

                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              title: Text('${island.atollAbbreviation}. ${island.islandName}'),
            );
          },
        );
      },
    );
  }
}
