import 'package:flutter/material.dart';

class SmartScreen extends StatefulWidget {
  const SmartScreen({Key? key}) : super(key: key);

  @override
  _SmartScreenState createState() => _SmartScreenState();
}

class _SmartScreenState extends State<SmartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Smart"),
        ),
        body: Container(
          child: Text("Smart Screen"),
        ));
  }
}
