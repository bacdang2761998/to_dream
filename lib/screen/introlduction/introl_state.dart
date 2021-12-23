import 'package:freezed_annotation/freezed_annotation.dart';
part 'introl_state.freezed.dart';

@freezed
abstract class IntrolState with _$IntrolState {
  factory IntrolState(
      {@Default(false) bool isChecked,
      @Default(true) bool isAbsorb}) = _IntrolState;
}
