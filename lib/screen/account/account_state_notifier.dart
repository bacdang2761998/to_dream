import 'dart:io';

import 'package:dream/screen/account/account_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import 'account_model.dart';

const nameKey = 'name';
const birthKey = 'birthDay';
const Year = 'year';
const imagKey = 'image';

class AccountStateNotifier extends StateNotifier<AccountState>
    with LocatorMixin {
  AccountStateNotifier() : super(AccountState());

  Future setImage(File? imagePicker) async {
    state = AccountState(image: imagePicker);
  }

  void setDate(DateTime isNewDate) {
    state = state.copyWith(date: isNewDate);
  }

  Future<void> getAccountInfo() async {
    final preferences = await SharedPreferences.getInstance();
    final name = preferences.getString(nameKey);
    final birthDay = preferences.getString(birthKey);
    final year = preferences.getString(Year);
    final imageAvata = preferences.getString(imagKey);
    final newacc = Account(
      name: name,
      birthDay: birthDay,
      year: year,
      avataAccount: imageAvata,
    );
    state = state.copyWith(account: newacc);
  }
}
