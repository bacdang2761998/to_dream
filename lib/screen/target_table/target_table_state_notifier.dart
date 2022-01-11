import 'package:dream/screen/target_table/target_table_state.dart';
import 'package:state_notifier/state_notifier.dart';

class TargetTableStateNotifier extends StateNotifier<TargetTableState>
    with LocatorMixin {
  TargetTableStateNotifier() : super(TargetTableState());

  void setTargetChecked(bool isNewTargetCheck) {
    state = TargetTableState(isTargetChecked: isNewTargetCheck);
  }
}
