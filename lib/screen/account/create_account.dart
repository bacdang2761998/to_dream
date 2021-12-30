import 'package:dream/app_other/app_string.dart';
import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/account/account_provider.dart';
import 'package:dream/screen/account/image_setting_screen.dart';
import 'package:dream/screen/bottom_bar/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_model.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lifeSpanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final account = Account();
  Image? imageAvata;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lifeSpanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          locale.account,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () => checkDone(errorTitle: locale.error),
              child: Text(
                locale.done,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
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
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    ImageSettingScreen(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              textDirection: TextDirection.ltr,
                              textCapitalization: TextCapitalization.sentences,
                              controller: _nameController,
                              decoration:
                                  InputDecoration(hintText: locale.name),
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
                                    Text(locale.birthday),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Consumer<AccountProvider>(
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
                            TextFormField(
                              autocorrect: true,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.number,
                              controller: _lifeSpanController,
                              decoration: InputDecoration(
                                  hintText: locale.life,
                                  suffix: Text(locale.year),
                                  border: InputBorder.none),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
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
                          locale.content2,
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

  void saveAccount() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, _nameController.text);
    await preferences.setString(Year, _lifeSpanController.text);
  }

  void checkDone({required String errorTitle}) {
    if (_nameController.text.isEmpty || _lifeSpanController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Center(child: Text(errorTitle)),
                actions: [
                  Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.error,
                        color: Colors.redAccent,
                        size: 30,
                      )),
                ],
              ));
    } else {
      saveAccount();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
    }
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
          child: Consumer<AccountProvider>(
            builder: (BuildContext context, model, child) =>
                CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (isNewDate) {
                if (isNewDate != model.date) model.setDate(isNewDate);
              },
              initialDateTime: model.date,
              maximumYear: DateTime.now().year,
              minimumYear: 1900,
            ),
          ),
        );
      });
}
