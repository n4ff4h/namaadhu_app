// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_island_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectedIslandState _$SelectedIslandStateFromJson(Map<String, dynamic> json) =>
    _SelectedIslandState(
      id: (json['id'] as num).toInt(),
      atollAbbreviation: json['atollAbbreviation'] as String,
      islandName: json['islandName'] as String,
    );

Map<String, dynamic> _$SelectedIslandStateToJson(
  _SelectedIslandState instance,
) => <String, dynamic>{
  'id': instance.id,
  'atollAbbreviation': instance.atollAbbreviation,
  'islandName': instance.islandName,
};
