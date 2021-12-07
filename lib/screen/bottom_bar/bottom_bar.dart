import 'package:dream/screen/option/option_screen.dart';
import 'package:dream/screen/smart/smart_screen.dart';
import 'package:dream/screen/target_screen/target_screen.dart';
import 'package:dream/screen/target_table/target_table_screen.dart';
import 'package:dream/screen/time_line/time_line_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  Widget _timeLineScreen = TimeLineScreen();
  Widget _targetScreen = TargetScreen();
  Widget _smartScreen = SmartScreen();
  Widget _targetTableScreen = TargetTableScreen();
  Widget _optionScreen = OptionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(2, 3), blurRadius: 3)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Time Line"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Target"),
            BottomNavigationBarItem(
                icon: Icon(Icons.picture_in_picture), label: "Smart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "Target Table"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                backgroundColor:
                    this.selectedIndex == 4 ? Colors.blue : Colors.grey,
                label: "Option"),
          ],
          onTap: (int index) {
            onTabHandler(index);
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (this.selectedIndex == 0) {
      return this._timeLineScreen;
    } else if (this.selectedIndex == 1) {
      return this._targetScreen;
    } else if (this.selectedIndex == 2) {
      return this._smartScreen;
    } else if (this.selectedIndex == 3) {
      return this._targetTableScreen;
    } else {
      return this._optionScreen;
    }
  }

  void onTabHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
