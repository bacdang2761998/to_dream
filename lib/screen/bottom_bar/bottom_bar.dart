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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(2, 3), blurRadius: 3)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Time Line"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: "Target"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.picture_in_picture), label: "Smart"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "Target Table"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.menu),
                backgroundColor: selectedIndex == 4 ? Colors.blue : Colors.grey,
                label: "Option"),
          ],
          onTap: (int index) {
            onTabHandler(index);
          },
        ),
      ),
    );
  }

  Widget _timeLineScreen() {
    return const TimeLineScreen();
  }

  Widget _targetScreen() {
    return const TargetScreen();
  }

  Widget _smartScreen() {
    return const SmartScreen();
  }

  Widget _targetTableScreen() {
    return const TargetTableScreen();
  }

  Widget _optionScreen() {
    return const OptionScreen();
  }

  Widget _buildBody() {
    if (selectedIndex == 0) {
      return _timeLineScreen();
    } else if (selectedIndex == 1) {
      return _targetScreen();
    } else if (selectedIndex == 2) {
      return _smartScreen();
    } else if (selectedIndex == 3) {
      return _targetTableScreen();
    } else {
      return _optionScreen();
    }
  }

  void onTabHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
