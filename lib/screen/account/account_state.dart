import 'dart:io';
import 'package:dream/screen/account/account_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  factory AccountState({File? image, Account? account, DateTime? date}) =
      _AccountState;
}
