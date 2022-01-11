// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'language_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LanguageStateTearOff {
  const _$LanguageStateTearOff();

  _LanguageState call(
      {Language? language, Locale currentLocale = const Locale('vi', 'VN')}) {
    return _LanguageState(
      language: language,
      currentLocale: currentLocale,
    );
  }
}

/// @nodoc
const $LanguageState = _$LanguageStateTearOff();

/// @nodoc
mixin _$LanguageState {
  Language? get language => throw _privateConstructorUsedError;
  Locale get currentLocale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageStateCopyWith<LanguageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageStateCopyWith<$Res> {
  factory $LanguageStateCopyWith(
          LanguageState value, $Res Function(LanguageState) then) =
      _$LanguageStateCopyWithImpl<$Res>;
  $Res call({Language? language, Locale currentLocale});
}

/// @nodoc
class _$LanguageStateCopyWithImpl<$Res>
    implements $LanguageStateCopyWith<$Res> {
  _$LanguageStateCopyWithImpl(this._value, this._then);

  final LanguageState _value;
  // ignore: unused_field
  final $Res Function(LanguageState) _then;

  @override
  $Res call({
    Object? language = freezed,
    Object? currentLocale = freezed,
  }) {
    return _then(_value.copyWith(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      currentLocale: currentLocale == freezed
          ? _value.currentLocale
          : currentLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
abstract class _$LanguageStateCopyWith<$Res>
    implements $LanguageStateCopyWith<$Res> {
  factory _$LanguageStateCopyWith(
          _LanguageState value, $Res Function(_LanguageState) then) =
      __$LanguageStateCopyWithImpl<$Res>;
  @override
  $Res call({Language? language, Locale currentLocale});
}

/// @nodoc
class __$LanguageStateCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res>
    implements _$LanguageStateCopyWith<$Res> {
  __$LanguageStateCopyWithImpl(
      _LanguageState _value, $Res Function(_LanguageState) _then)
      : super(_value, (v) => _then(v as _LanguageState));

  @override
  _LanguageState get _value => super._value as _LanguageState;

  @override
  $Res call({
    Object? language = freezed,
    Object? currentLocale = freezed,
  }) {
    return _then(_LanguageState(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      currentLocale: currentLocale == freezed
          ? _value.currentLocale
          : currentLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_LanguageState implements _LanguageState {
  _$_LanguageState(
      {this.language, this.currentLocale = const Locale('vi', 'VN')});

  @override
  final Language? language;
  @JsonKey(defaultValue: const Locale('vi', 'VN'))
  @override
  final Locale currentLocale;

  @override
  String toString() {
    return 'LanguageState(language: $language, currentLocale: $currentLocale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LanguageState &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.currentLocale, currentLocale) ||
                const DeepCollectionEquality()
                    .equals(other.currentLocale, currentLocale)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(currentLocale);

  @JsonKey(ignore: true)
  @override
  _$LanguageStateCopyWith<_LanguageState> get copyWith =>
      __$LanguageStateCopyWithImpl<_LanguageState>(this, _$identity);
}

abstract class _LanguageState implements LanguageState {
  factory _LanguageState({Language? language, Locale currentLocale}) =
      _$_LanguageState;

  @override
  Language? get language => throw _privateConstructorUsedError;
  @override
  Locale get currentLocale => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LanguageStateCopyWith<_LanguageState> get copyWith =>
      throw _privateConstructorUsedError;
}
