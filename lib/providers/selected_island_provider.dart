import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaadhu_vaguthu/global_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final selectedIslandProvider =
    StateNotifierProvider<SelectedIslandNotifier, int>(
  (ref) {
    return SelectedIslandNotifier(ref.read(sharedPreferencesProvider));
  },
);

class SelectedIslandNotifier extends StateNotifier<int> {
  final SharedPreferences pref;

  SelectedIslandNotifier(this.pref)
      : super(pref.getInt('selectedIslandId') ?? -1);

  int? getSelectedIslandId() {
    return pref.getInt('selectedIslandId');
  }

  void setSelectedIslandId(int id) {
    pref.setInt('selectedIslandId', id);
  }
}
