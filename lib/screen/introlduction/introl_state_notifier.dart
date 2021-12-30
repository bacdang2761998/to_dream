import 'package:dream/screen/introlduction/introl_state.dart';
import 'package:state_notifier/state_notifier.dart';

class IntrolStateNotifier extends StateNotifier<IntrolState> with LocatorMixin {
  IntrolStateNotifier() : super(IntrolState());

  void setChecked(bool isNewChecked) {
    state = IntrolState(isChecked: isNewChecked);
  }

  void setAbsorb() {
    state != state.copyWith(isAbsorb: false);
  }
}
