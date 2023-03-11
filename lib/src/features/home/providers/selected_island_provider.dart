import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_app/src/features/home/models/selected_island_state.dart';
import 'package:namaadhu_app/src/features/home/providers/global_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final selectedIslandProvider =
    StateNotifierProvider<SelectedIslandNotifier, SelectedIslandState>(
  (ref) {
    return SelectedIslandNotifier(ref, ref.read(sharedPreferencesProvider));
  },
);

class SelectedIslandNotifier extends StateNotifier<SelectedIslandState> {
  final StateNotifierProviderRef ref;
  final SharedPreferences pref;

  SelectedIslandNotifier(this.ref, this.pref)
      : super(SelectedIslandState(
          id: pref.getInt('selectedIslandId') ?? -1,
          atollAbbreviation:
              pref.getString('selectedAtollAbbreviation') ?? 'none',
          islandName: pref.getString('selectedIslandName') ?? 'none',
        ));

  void setSelectedIsland({
    required int id,
    required String atollAbbreviation,
    required String islandName,
  }) async {
    pref.setInt('selectedIslandId', id);
    pref.setString('selectedAtollAbbreviation', atollAbbreviation);
    pref.setString('selectedIslandName', islandName);
    state = state.copyWith(
      id: id,
      atollAbbreviation: atollAbbreviation,
      islandName: islandName,
    );
  }
}
