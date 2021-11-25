import 'package:dream/screen/2/2.dart';
import 'package:dream/screen/3/3.dart';
import 'package:dream/screen/4/4.dart';
import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/option/option_screen.dart';
import 'package:dream/screen/time_line/time_line_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  Widget _homeScreen = TimeLineScreen();
  Widget _chatScreen = A2();
  Widget _photoScreen = A3();
  Widget _groupScreen = A4();
  Widget _optionScreen = OptionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateAccount()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(2, 3), blurRadius: 3)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor:
                    this.selectedIndex == 0 ? Colors.green : Colors.white60,
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                backgroundColor:
                    this.selectedIndex == 1 ? Colors.green : Colors.white60,
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.picture_in_picture),
                backgroundColor:
                    this.selectedIndex == 2 ? Colors.green : Colors.white60,
                label: "Photo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                backgroundColor:
                    this.selectedIndex == 3 ? Colors.green : Colors.white60,
                label: "Group"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                backgroundColor:
                    this.selectedIndex == 4 ? Colors.green : Colors.white60,
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
      return this._homeScreen;
    } else if (this.selectedIndex == 1) {
      return this._chatScreen;
    } else if (this.selectedIndex == 2) {
      return this._photoScreen;
    } else if (this.selectedIndex == 3) {
      return this._groupScreen;
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
