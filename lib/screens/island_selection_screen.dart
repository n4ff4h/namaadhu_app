import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/widgets/custom_search_delegate.dart';

class IslandSelectionScreen extends ConsumerWidget {
  const IslandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final islandList = ref.watch(islandsProvider);
    final atollList = ref.watch(atollsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Island',
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(islandList, atollList),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: atollList.length,
        itemBuilder: (context, index) {
          Atoll atoll = atollList[index];
          List<Island> islandsFromAtoll = islandList
              .where((element) => element.atollNumber == atoll.id)
              .toList();

          return ExpansionTile(
            title: Text('${atoll.atollName} (${atoll.atollAbbreviation})'),
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: islandsFromAtoll.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      final selectedIsland = ref.watch(selectedIslandProvider);
                      final selectedIslandNotifier =
                          ref.watch(selectedIslandProvider.notifier);

                      selectedIslandNotifier
                          .setSelectedIslandId(islandsFromAtoll[index].id);
                      selectedIslandNotifier.setSelectedAtollAbbreviation(
                          atoll.atollAbbreviation);
                      selectedIslandNotifier.setSelectedIslandName(
                          islandsFromAtoll[index].islandName);

                      selectedIsland.id == -1
                          ? Navigator.popAndPushNamed(context, 'home')
                          : Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        '${atoll.atollAbbreviation}. ${islandsFromAtoll[index].islandName}',
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
