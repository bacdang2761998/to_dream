import 'package:dream/app_other/app_string.dart';
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
  const CreateAccount({Key? key}) : super(key: key);
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Create New Account',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () => {checkDone()},
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
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
                    const ImageSettingScreen(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              textDirection: TextDirection.ltr,
                              textCapitalization: TextCapitalization.sentences,
                              controller: _nameController,
                              decoration:
                                  const InputDecoration(hintText: 'Name'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                alignment: Alignment.topRight,
                                height: 28,
                                decoration: const BoxDecoration(
                                    border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.grey),
                                )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Birthday'),
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
                                            '${model.date.day} / ${model.date.month} / ${model.date.year}',
                                            style: const TextStyle(
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
                              decoration: const InputDecoration(
                                  hintText: 'Life',
                                  suffix: Text('Year'),
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
                      child: const Center(
                        child: Text(
                          AppString.contentIntrol2,
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

  Future<void> saveAccount() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, _nameController.text);
    await preferences.setString(yearKey, _lifeSpanController.text);
  }

  void checkDone() {
    if (_nameController.text.isEmpty || _lifeSpanController.text.isEmpty) {
      showDialog<Widget>(
          context: context,
          builder: (_) => AlertDialog(
                title:
                    const Center(child: Text('Please enter all information !')),
                actions: [
                  Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.error,
                        color: Colors.redAccent,
                        size: 30,
                      )),
                ],
              ));
    } else {
      saveAccount();
      Navigator.push<void>(
          context, MaterialPageRoute(builder: (context) => const BottomBar()));
    }
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.height, size.width)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

void showDatePicker(BuildContext context) {
  showCupertinoModalPopup<Widget>(
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
                if (isNewDate != model.date) {
                  model.setDate(isNewDate);
                }
              },
              initialDateTime: model.date,
              maximumYear: DateTime.now().year,
              minimumYear: 1900,
            ),
          ),
        );
      });
}
