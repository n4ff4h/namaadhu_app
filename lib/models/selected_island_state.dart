import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'selected_island_state.freezed.dart';
part 'selected_island_state.g.dart';

@freezed
class SelectedIslandState with _$SelectedIslandState {
  const factory SelectedIslandState({
    required int id,
    required String atollAbbreviation,
    required String islandName,
  }) = _SelectedIslandState;

  factory SelectedIslandState.fromJson(Map<String, Object?> json) =>
      _$SelectedIslandStateFromJson(json);
}
