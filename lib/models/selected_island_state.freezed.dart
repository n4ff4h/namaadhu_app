// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_island_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedIslandState _$SelectedIslandStateFromJson(Map<String, dynamic> json) {
  return _SelectedIslandState.fromJson(json);
}

/// @nodoc
mixin _$SelectedIslandState {
  int get id => throw _privateConstructorUsedError;
  String get atollAbbreviation => throw _privateConstructorUsedError;
  String get islandName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedIslandStateCopyWith<SelectedIslandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedIslandStateCopyWith<$Res> {
  factory $SelectedIslandStateCopyWith(
          SelectedIslandState value, $Res Function(SelectedIslandState) then) =
      _$SelectedIslandStateCopyWithImpl<$Res, SelectedIslandState>;
  @useResult
  $Res call({int id, String atollAbbreviation, String islandName});
}

/// @nodoc
class _$SelectedIslandStateCopyWithImpl<$Res, $Val extends SelectedIslandState>
    implements $SelectedIslandStateCopyWith<$Res> {
  _$SelectedIslandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atollAbbreviation = null,
    Object? islandName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      atollAbbreviation: null == atollAbbreviation
          ? _value.atollAbbreviation
          : atollAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      islandName: null == islandName
          ? _value.islandName
          : islandName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectedIslandStateCopyWith<$Res>
    implements $SelectedIslandStateCopyWith<$Res> {
  factory _$$_SelectedIslandStateCopyWith(_$_SelectedIslandState value,
          $Res Function(_$_SelectedIslandState) then) =
      __$$_SelectedIslandStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String atollAbbreviation, String islandName});
}

/// @nodoc
class __$$_SelectedIslandStateCopyWithImpl<$Res>
    extends _$SelectedIslandStateCopyWithImpl<$Res, _$_SelectedIslandState>
    implements _$$_SelectedIslandStateCopyWith<$Res> {
  __$$_SelectedIslandStateCopyWithImpl(_$_SelectedIslandState _value,
      $Res Function(_$_SelectedIslandState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atollAbbreviation = null,
    Object? islandName = null,
  }) {
    return _then(_$_SelectedIslandState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      atollAbbreviation: null == atollAbbreviation
          ? _value.atollAbbreviation
          : atollAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      islandName: null == islandName
          ? _value.islandName
          : islandName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectedIslandState
    with DiagnosticableTreeMixin
    implements _SelectedIslandState {
  const _$_SelectedIslandState(
      {required this.id,
      required this.atollAbbreviation,
      required this.islandName});

  factory _$_SelectedIslandState.fromJson(Map<String, dynamic> json) =>
      _$$_SelectedIslandStateFromJson(json);

  @override
  final int id;
  @override
  final String atollAbbreviation;
  @override
  final String islandName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedIslandState(id: $id, atollAbbreviation: $atollAbbreviation, islandName: $islandName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedIslandState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('atollAbbreviation', atollAbbreviation))
      ..add(DiagnosticsProperty('islandName', islandName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedIslandState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.atollAbbreviation, atollAbbreviation) ||
                other.atollAbbreviation == atollAbbreviation) &&
            (identical(other.islandName, islandName) ||
                other.islandName == islandName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, atollAbbreviation, islandName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedIslandStateCopyWith<_$_SelectedIslandState> get copyWith =>
      __$$_SelectedIslandStateCopyWithImpl<_$_SelectedIslandState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectedIslandStateToJson(
      this,
    );
  }
}

abstract class _SelectedIslandState implements SelectedIslandState {
  const factory _SelectedIslandState(
      {required final int id,
      required final String atollAbbreviation,
      required final String islandName}) = _$_SelectedIslandState;

  factory _SelectedIslandState.fromJson(Map<String, dynamic> json) =
      _$_SelectedIslandState.fromJson;

  @override
  int get id;
  @override
  String get atollAbbreviation;
  @override
  String get islandName;
  @override
  @JsonKey(ignore: true)
  _$$_SelectedIslandStateCopyWith<_$_SelectedIslandState> get copyWith =>
      throw _privateConstructorUsedError;
}
