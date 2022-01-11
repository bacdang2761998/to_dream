import 'package:freezed_annotation/freezed_annotation.dart';
part 'target_table_state.freezed.dart';

@freezed
abstract class TargetTableState with _$TargetTableState {
  factory TargetTableState({
    @Default(false) bool isTargetChecked,
  }) = _TargetTableState;
}
