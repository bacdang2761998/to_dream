import 'dart:ui';
import 'package:dream/app_string.dart';
import 'package:dream/screen/introlduction/intro_provider.dart';
import 'package:dream/screen/introlduction/webview_accep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../account/create_account.dart';

// TODO(bac): fix warning, các màn khác sửa tương tự
class IntroScreen extends StatelessWidget {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 160, 20, 10),
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [myPage1(), myPage2(), myPage3(context: context)],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                      activeDotColor: Colors.blueAccent,
                      dotColor: Colors.white38,
                      dotHeight: 8,
                      dotWidth: 8,
                      type: WormType.thin),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget checkBox() {
    return Consumer<IntroProvider>(
      builder: (context, model, child) => Checkbox(
        checkColor: Colors.white,
        onChanged: (isNewChecked) {
          model.setIsChecked(isNewChecked!);
        },
        value: model.isChecked,
      ),
    );
  }

  Widget myPage1({Color backgroundColor = Colors.lightBlue}) {
    return Container(
        color: backgroundColor,
        child: Text(AppString.CONTENT1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, color: Colors.white)));
  }

  Widget myPage2() {
    return Container(
        color: Colors.lightBlue,
        child: Text(AppString.CONTENT2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, color: Colors.white)));
  }

  Widget myPage3({required BuildContext context}) {
    // bool value = context.watch<IntroProvider>().isAbsorb;
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  AppString.CONTENT3,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, color: Colors.white),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text("Terms of service",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline)),
                    onTap: () {
                      // TODO(bac): sử dụng provider thay setState
                      // setState(() {});

                      context.watch<IntroProvider>().setIsAbsorb();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewAccep()));
                      // print(value);
                    },
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ),
            ),
            Expanded(
              child: AbsorbPointer(
                absorbing: context.watch<IntroProvider>().isAbsorb,
                child: Opacity(
                  opacity: context.watch<IntroProvider>().isAbsorb ? 0.5 : 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            checkBox(),
                            Text(
                              AppString.ACCEPT,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Consumer<IntroProvider>(
                            builder: (BuildContext context, model, child) =>
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightBlue,
                                      onPrimary: Colors.white,
                                      fixedSize: Size(
                                          MediaQuery.of(context).size.width,
                                          20),
                                    ),
                                    onPressed: () {
                                      if (model.isChecked)
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateAccount()),
                                            (route) => false);
                                    },
                                    child: Text("Go Home")),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
