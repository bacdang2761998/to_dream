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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Option"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _titleBox("1 ToDO", size.height / 10),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _titleBox("2 ToDo", size.height / 10),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _titleBox("3 ToDo", size.height / 10),
            _listTitle(textTitle: "textTitle", child: iconNext, onTap: () {}),
            _listTitle(
                textTitle: "textTitle", child: switchTitle, onTap: () {}),
            _listTitle(textTitle: "textTitle", child: Text(""), onTap: () {}),
            _titleBox("3TODO", size.height / 10),
            _listTitle(
                textTitle: "textTitle", child: switchTitle, onTap: () {}),
            _titleBox("", size.height / 20),
            _listTitle(textTitle: "textTitle", child: Text(""), onTap: () {}),
            _listTitleShare("textTitle ")
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
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        tittle,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
