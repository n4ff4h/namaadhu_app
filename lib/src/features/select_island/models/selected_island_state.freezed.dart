// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_island_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectedIslandState implements DiagnosticableTreeMixin {

 int get id; String get atollAbbreviation; String get islandName;
/// Create a copy of SelectedIslandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedIslandStateCopyWith<SelectedIslandState> get copyWith => _$SelectedIslandStateCopyWithImpl<SelectedIslandState>(this as SelectedIslandState, _$identity);

  /// Serializes this SelectedIslandState to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SelectedIslandState'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('atollAbbreviation', atollAbbreviation))..add(DiagnosticsProperty('islandName', islandName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedIslandState&&(identical(other.id, id) || other.id == id)&&(identical(other.atollAbbreviation, atollAbbreviation) || other.atollAbbreviation == atollAbbreviation)&&(identical(other.islandName, islandName) || other.islandName == islandName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,atollAbbreviation,islandName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SelectedIslandState(id: $id, atollAbbreviation: $atollAbbreviation, islandName: $islandName)';
}


}

/// @nodoc
abstract mixin class $SelectedIslandStateCopyWith<$Res>  {
  factory $SelectedIslandStateCopyWith(SelectedIslandState value, $Res Function(SelectedIslandState) _then) = _$SelectedIslandStateCopyWithImpl;
@useResult
$Res call({
 int id, String atollAbbreviation, String islandName
});




}
/// @nodoc
class _$SelectedIslandStateCopyWithImpl<$Res>
    implements $SelectedIslandStateCopyWith<$Res> {
  _$SelectedIslandStateCopyWithImpl(this._self, this._then);

  final SelectedIslandState _self;
  final $Res Function(SelectedIslandState) _then;

/// Create a copy of SelectedIslandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? atollAbbreviation = null,Object? islandName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,atollAbbreviation: null == atollAbbreviation ? _self.atollAbbreviation : atollAbbreviation // ignore: cast_nullable_to_non_nullable
as String,islandName: null == islandName ? _self.islandName : islandName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectedIslandState].
extension SelectedIslandStatePatterns on SelectedIslandState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedIslandState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedIslandState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedIslandState value)  $default,){
final _that = this;
switch (_that) {
case _SelectedIslandState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedIslandState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedIslandState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String atollAbbreviation,  String islandName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedIslandState() when $default != null:
return $default(_that.id,_that.atollAbbreviation,_that.islandName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String atollAbbreviation,  String islandName)  $default,) {final _that = this;
switch (_that) {
case _SelectedIslandState():
return $default(_that.id,_that.atollAbbreviation,_that.islandName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String atollAbbreviation,  String islandName)?  $default,) {final _that = this;
switch (_that) {
case _SelectedIslandState() when $default != null:
return $default(_that.id,_that.atollAbbreviation,_that.islandName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectedIslandState with DiagnosticableTreeMixin implements SelectedIslandState {
  const _SelectedIslandState({required this.id, required this.atollAbbreviation, required this.islandName});
  factory _SelectedIslandState.fromJson(Map<String, dynamic> json) => _$SelectedIslandStateFromJson(json);

@override final  int id;
@override final  String atollAbbreviation;
@override final  String islandName;

/// Create a copy of SelectedIslandState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedIslandStateCopyWith<_SelectedIslandState> get copyWith => __$SelectedIslandStateCopyWithImpl<_SelectedIslandState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectedIslandStateToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SelectedIslandState'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('atollAbbreviation', atollAbbreviation))..add(DiagnosticsProperty('islandName', islandName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedIslandState&&(identical(other.id, id) || other.id == id)&&(identical(other.atollAbbreviation, atollAbbreviation) || other.atollAbbreviation == atollAbbreviation)&&(identical(other.islandName, islandName) || other.islandName == islandName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,atollAbbreviation,islandName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SelectedIslandState(id: $id, atollAbbreviation: $atollAbbreviation, islandName: $islandName)';
}


}

/// @nodoc
abstract mixin class _$SelectedIslandStateCopyWith<$Res> implements $SelectedIslandStateCopyWith<$Res> {
  factory _$SelectedIslandStateCopyWith(_SelectedIslandState value, $Res Function(_SelectedIslandState) _then) = __$SelectedIslandStateCopyWithImpl;
@override @useResult
$Res call({
 int id, String atollAbbreviation, String islandName
});




}
/// @nodoc
class __$SelectedIslandStateCopyWithImpl<$Res>
    implements _$SelectedIslandStateCopyWith<$Res> {
  __$SelectedIslandStateCopyWithImpl(this._self, this._then);

  final _SelectedIslandState _self;
  final $Res Function(_SelectedIslandState) _then;

/// Create a copy of SelectedIslandState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? atollAbbreviation = null,Object? islandName = null,}) {
  return _then(_SelectedIslandState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,atollAbbreviation: null == atollAbbreviation ? _self.atollAbbreviation : atollAbbreviation // ignore: cast_nullable_to_non_nullable
as String,islandName: null == islandName ? _self.islandName : islandName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
