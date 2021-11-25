import 'dart:io';

import 'package:dream/app_string.dart';
import 'package:dream/screen/bottom_bar/bottom_bar.dart';
import 'package:dream/screen/account/image_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateProvider extends ChangeNotifier {
  File? _image;

  DateTime _date = DateTime.now();

  DateTime get date => _date;

  File? get image => _image;

  Future setImage(var imagePicker) async {
    _image = imagePicker;
    notifyListeners();
  }

  void setDate(DateTime isNewDate) {
    _date = isNewDate;
    notifyListeners();
  }
}

// TODO(bac): Tìm hiểu lint cho dart và apply lint vào dự án
class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
// TODO(bac): search lại cách dùng TextEditingController
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lifeSpanController =
      TextEditingController(text: "Year");
  @override
  void dispose() {
    _nameController.dispose();
    _lifeSpanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Create New Account"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBar()));
              },
              child: Text(
                "Done",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_background.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 20,
              color: Colors.white60,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  ImageSetting(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            textDirection: TextDirection.ltr,
                            textCapitalization: TextCapitalization.sentences,
                            controller: _nameController,
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              alignment: Alignment.topRight,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey),
                              )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Birthday"),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Consumer<CreateProvider>(
                                      builder: (BuildContext context, model,
                                              child) =>
                                          GestureDetector(
                                        onTap: () {
                                          showDatePicker(context);
                                        },
                                        child: Text(
                                          "${model.date.day} / ${model.date.month} / ${model.date.year}",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextField(
                            autocorrect: true,
                            textDirection: TextDirection.rtl,
                            keyboardType: TextInputType.number,
                            controller: _lifeSpanController,
                            decoration: InputDecoration(
                                hintText: "Life", border: InputBorder.none),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  // TODO(bac): set luon padding trong container
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white10,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: size.height * 1 / 3,
                      child: Center(
                        child: Text(
                          AppString.CONTENT2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

void showDatePicker(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.25,
          color: Colors.white,
          child: Consumer<CreateProvider>(
            builder: (BuildContext context, model, child) =>
                CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (isNewDate) {
                if (isNewDate != model.date) model.setDate(isNewDate);
              },
              initialDateTime: model.date,
              maximumYear: 2100,
              minimumYear: 1900,
            ),
          ),
        );
      });
}
