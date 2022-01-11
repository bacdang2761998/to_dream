import 'dart:ui';
import 'package:dream/screen/option/language_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'language_state.freezed.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  factory LanguageState(
      {Language? language,
      @Default(Locale('vi', 'VN')) Locale currentLocale}) = _LanguageState;
}
