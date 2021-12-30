// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'introl_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IntrolStateTearOff {
  const _$IntrolStateTearOff();

  _IntrolState call({bool isChecked = false, bool isAbsorb = true}) {
    return _IntrolState(
      isChecked: isChecked,
      isAbsorb: isAbsorb,
    );
  }
}

/// @nodoc
const $IntrolState = _$IntrolStateTearOff();

/// @nodoc
mixin _$IntrolState {
  bool get isChecked => throw _privateConstructorUsedError;
  bool get isAbsorb => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntrolStateCopyWith<IntrolState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntrolStateCopyWith<$Res> {
  factory $IntrolStateCopyWith(
          IntrolState value, $Res Function(IntrolState) then) =
      _$IntrolStateCopyWithImpl<$Res>;
  $Res call({bool isChecked, bool isAbsorb});
}

/// @nodoc
class _$IntrolStateCopyWithImpl<$Res> implements $IntrolStateCopyWith<$Res> {
  _$IntrolStateCopyWithImpl(this._value, this._then);

  final IntrolState _value;
  // ignore: unused_field
  final $Res Function(IntrolState) _then;

  @override
  $Res call({
    Object? isChecked = freezed,
    Object? isAbsorb = freezed,
  }) {
    return _then(_value.copyWith(
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isAbsorb: isAbsorb == freezed
          ? _value.isAbsorb
          : isAbsorb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$IntrolStateCopyWith<$Res>
    implements $IntrolStateCopyWith<$Res> {
  factory _$IntrolStateCopyWith(
          _IntrolState value, $Res Function(_IntrolState) then) =
      __$IntrolStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isChecked, bool isAbsorb});
}

/// @nodoc
class __$IntrolStateCopyWithImpl<$Res> extends _$IntrolStateCopyWithImpl<$Res>
    implements _$IntrolStateCopyWith<$Res> {
  __$IntrolStateCopyWithImpl(
      _IntrolState _value, $Res Function(_IntrolState) _then)
      : super(_value, (v) => _then(v as _IntrolState));

  @override
  _IntrolState get _value => super._value as _IntrolState;

  @override
  $Res call({
    Object? isChecked = freezed,
    Object? isAbsorb = freezed,
  }) {
    return _then(_IntrolState(
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isAbsorb: isAbsorb == freezed
          ? _value.isAbsorb
          : isAbsorb // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IntrolState implements _IntrolState {
  _$_IntrolState({this.isChecked = false, this.isAbsorb = true});

  @JsonKey(defaultValue: false)
  @override
  final bool isChecked;
  @JsonKey(defaultValue: true)
  @override
  final bool isAbsorb;

  @override
  String toString() {
    return 'IntrolState(isChecked: $isChecked, isAbsorb: $isAbsorb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IntrolState &&
            (identical(other.isChecked, isChecked) ||
                const DeepCollectionEquality()
                    .equals(other.isChecked, isChecked)) &&
            (identical(other.isAbsorb, isAbsorb) ||
                const DeepCollectionEquality()
                    .equals(other.isAbsorb, isAbsorb)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isChecked) ^
      const DeepCollectionEquality().hash(isAbsorb);

  @JsonKey(ignore: true)
  @override
  _$IntrolStateCopyWith<_IntrolState> get copyWith =>
      __$IntrolStateCopyWithImpl<_IntrolState>(this, _$identity);
}

abstract class _IntrolState implements IntrolState {
  factory _IntrolState({bool isChecked, bool isAbsorb}) = _$_IntrolState;

  @override
  bool get isChecked => throw _privateConstructorUsedError;
  @override
  bool get isAbsorb => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IntrolStateCopyWith<_IntrolState> get copyWith =>
      throw _privateConstructorUsedError;
}
