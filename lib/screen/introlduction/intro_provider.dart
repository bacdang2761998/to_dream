import 'package:flutter/foundation.dart';

class IntroProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool _isAbsorb = true;

  bool get isChecked => _isChecked;
  bool get isAbsorb => _isAbsorb;
  void setIsChecked(bool isNewChecked) {
    _isChecked = isNewChecked;
    notifyListeners();
  }

  void setIsAbsorb() {
    _isAbsorb = !isAbsorb;

    notifyListeners();
  }
}
