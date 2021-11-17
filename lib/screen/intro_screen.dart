import 'dart:ui';
import 'package:dream/app_string.dart';
import 'package:dream/screen/webview_accep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'create_account.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

bool _isChecked = false;
bool _isAbsorb = true;

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final checkBox = Checkbox(
        checkColor: Colors.white,
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        });

    final MyPage1 = Container(
        color: Colors.deepOrangeAccent,
        child: Text(
            AppString.CONTENT1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, color: Colors.white)));
    final MyPage2 = Container(
        color: Colors.deepOrangeAccent,
        child: Text(AppString.CONTENT2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, color: Colors.white)));
    final MyPage3 = Container(

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
                      _isAbsorb = !_isAbsorb;
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewAccep()));
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
                absorbing: _isAbsorb,
                child: Opacity(
                  opacity: _isAbsorb ? 0.5 : 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            checkBox,
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
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
                                onPrimary: Colors.white,
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 20),
                              ),
                              onPressed: () {
                                _isChecked
                                    ? Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CreateAccount()),
                                        (route) => false)
                                    : null;
                              },
                              child: Text("Go Home")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));

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
              children: <Widget>[MyPage1, MyPage2, MyPage3],
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
                  // onDotClicked: (index) => _controller.animateToPage(index ,curve: Curves.bounceOut, duration: null),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
