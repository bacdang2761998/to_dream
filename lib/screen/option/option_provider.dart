import 'package:flutter/cupertino.dart';

class OptionProvider extends ChangeNotifier {
  bool _isSwitch = false;

  bool get isSwitch => _isSwitch;
  void setIsSwitch({required bool isNewSwitch}) {
    _isSwitch = isNewSwitch;
    notifyListeners();
  }
}
