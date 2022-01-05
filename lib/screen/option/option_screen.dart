import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/option/language_screen.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  final iconNext = Icon(Icons.navigate_next);
  final iconShare = Icon(Icons.open_in_new);
  final switchTitle = Switch(value: false, onChanged: (value) {});

  @override
  Widget build(BuildContext context) {
    String mission = S.of(context).yourMission;
    String options = S.of(context).option;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).option,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
              },
              child: Text(
                S.of(context).language,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _titleBox("${options} 1", size.height / 10),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _titleBox("${options} 2", size.height / 10),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _titleBox("${options} 3", size.height / 10),
            _listTitle(textTitle: mission, child: iconNext, onTap: () {}),
            _listTitle(textTitle: mission, child: switchTitle, onTap: () {}),
            _listTitle(textTitle: mission, child: Text(""), onTap: () {}),
            _titleBox("${options} 4", size.height / 10),
            _listTitle(textTitle: mission, child: switchTitle, onTap: () {}),
            _titleBox("", size.height / 20),
            _listTitle(textTitle: mission, child: Text(""), onTap: () {}),
            _listTitleShare(mission)
          ],
        ),
      ),
    );
  }
}

Widget _listTitle({
  required String textTitle,
  required Widget child,
  required void Function()? onTap,
}) {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Text(textTitle),
          ],
        ),
        trailing: child,
        onTap: onTap,
      ),
      Divider()
    ],
  );
}

Widget _listTitleShare(
  String textTitle,
) {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Text(textTitle),
            Icon(
              Icons.open_in_new,
              size: 15,
            )
          ],
        ),
        onTap: () {},
      ),
      Divider()
    ],
  );
}

Widget _titleBox(String tittle, double _height) {
  return Container(
    alignment: Alignment.bottomLeft,
    decoration: BoxDecoration(
      color: Colors.greenAccent,
    ),
    height: _height,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Text(
        tittle,
        style: TextStyle(fontSize: 24, color: Colors.yellow[900]),
      ),
    ),
  );
}
