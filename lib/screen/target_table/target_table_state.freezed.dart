// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'target_table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TargetTableStateTearOff {
  const _$TargetTableStateTearOff();

  _TargetTableState call({bool isTargetChecked = false}) {
    return _TargetTableState(
      isTargetChecked: isTargetChecked,
    );
  }
}

/// @nodoc
const $TargetTableState = _$TargetTableStateTearOff();

/// @nodoc
mixin _$TargetTableState {
  bool get isTargetChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TargetTableStateCopyWith<TargetTableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetTableStateCopyWith<$Res> {
  factory $TargetTableStateCopyWith(
          TargetTableState value, $Res Function(TargetTableState) then) =
      _$TargetTableStateCopyWithImpl<$Res>;
  $Res call({bool isTargetChecked});
}

/// @nodoc
class _$TargetTableStateCopyWithImpl<$Res>
    implements $TargetTableStateCopyWith<$Res> {
  _$TargetTableStateCopyWithImpl(this._value, this._then);

  final TargetTableState _value;
  // ignore: unused_field
  final $Res Function(TargetTableState) _then;

  @override
  $Res call({
    Object? isTargetChecked = freezed,
  }) {
    return _then(_value.copyWith(
      isTargetChecked: isTargetChecked == freezed
          ? _value.isTargetChecked
          : isTargetChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TargetTableStateCopyWith<$Res>
    implements $TargetTableStateCopyWith<$Res> {
  factory _$TargetTableStateCopyWith(
          _TargetTableState value, $Res Function(_TargetTableState) then) =
      __$TargetTableStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isTargetChecked});
}

/// @nodoc
class __$TargetTableStateCopyWithImpl<$Res>
    extends _$TargetTableStateCopyWithImpl<$Res>
    implements _$TargetTableStateCopyWith<$Res> {
  __$TargetTableStateCopyWithImpl(
      _TargetTableState _value, $Res Function(_TargetTableState) _then)
      : super(_value, (v) => _then(v as _TargetTableState));

  @override
  _TargetTableState get _value => super._value as _TargetTableState;

  @override
  $Res call({
    Object? isTargetChecked = freezed,
  }) {
    return _then(_TargetTableState(
      isTargetChecked: isTargetChecked == freezed
          ? _value.isTargetChecked
          : isTargetChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TargetTableState implements _TargetTableState {
  _$_TargetTableState({this.isTargetChecked = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isTargetChecked;

  @override
  String toString() {
    return 'TargetTableState(isTargetChecked: $isTargetChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TargetTableState &&
            (identical(other.isTargetChecked, isTargetChecked) ||
                const DeepCollectionEquality()
                    .equals(other.isTargetChecked, isTargetChecked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isTargetChecked);

  @JsonKey(ignore: true)
  @override
  _$TargetTableStateCopyWith<_TargetTableState> get copyWith =>
      __$TargetTableStateCopyWithImpl<_TargetTableState>(this, _$identity);
}

abstract class _TargetTableState implements TargetTableState {
  factory _TargetTableState({bool isTargetChecked}) = _$_TargetTableState;

  @override
  bool get isTargetChecked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TargetTableStateCopyWith<_TargetTableState> get copyWith =>
      throw _privateConstructorUsedError;
}
