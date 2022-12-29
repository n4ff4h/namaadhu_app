import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
import 'package:namaadhu_vaguthu/models/atoll.dart';
import 'package:namaadhu_vaguthu/models/island.dart';
import 'package:namaadhu_vaguthu/providers/selected_island_provider.dart';
import 'package:namaadhu_vaguthu/screens/custom_search_delegate.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';
import 'package:namaadhu_vaguthu/widgets/custom_expansion_tile.dart';

class IslandSelectionScreen extends ConsumerStatefulWidget {
  const IslandSelectionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IslandSelectionScreenState();
}

class _IslandSelectionScreenState extends ConsumerState<IslandSelectionScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: kCardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            title: const Text('Allow notifications'),
            content:
                const Text('Our app would like to show prayer time reminders'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don/t Allow',
                  style: TextStyle(
                    color: kMutedColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context));
                },
                child: const Text(
                  'Allow',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedIsland = ref.watch(selectedIslandProvider);
    final islandList = ref.watch(islandsProvider);
    final atollList = ref.watch(atollsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Island',
        ),
        centerTitle: true,
        leading: selectedIsland.id != -1
            ? IconButton(
                icon: const Icon(Ionicons.chevron_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(islandList, atollList),
              );
            },
            icon: const Icon(Ionicons.search),
          ),
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

          return CustomExpansionTile(
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
                      final selectedIslandNotifier =
                          ref.watch(selectedIslandProvider.notifier);

                      selectedIslandNotifier.setSelectedIsland(
                        id: islandsFromAtoll[index].id,
                        atollAbbreviation: atoll.atollAbbreviation,
                        islandName: islandsFromAtoll[index].islandName,
                      );

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
