import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/models/selected_island_state.dart';
import 'package:namaadhu_vaguthu/providers/global_providers.dart';
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

  void setSelectedIslandId(int id) async {
    pref.setInt('selectedIslandId', id);
    state = state.copyWith(id: id);
  }

  void setSelectedAtollAbbreviation(String atollAbbreviation) async {
    pref.setString('selectedAtollAbbreviation', atollAbbreviation);
    state = state.copyWith(atollAbbreviation: atollAbbreviation);
  }

  void setSelectedIslandName(String islandName) async {
    pref.setString('selectedIslandName', islandName);
    state = state.copyWith(islandName: islandName);
  }
}
