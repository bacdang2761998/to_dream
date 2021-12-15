import 'package:dream/app_other/app_string.dart';
import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/introlduction/introl_provider.dart';
import 'package:dream/screen/introlduction/webview_accep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 160, 20, 10),
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                myPage(content: AppString.CONTENT1),
                myPage(content: AppString.CONTENT3),
                myPage3(context: context)
              ],
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

  Widget myPage({required String content}) {
    return Container(
        color: Colors.lightBlue,
        child: Text(content,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, color: Colors.white)));
  }

  Widget myPage3({required BuildContext context}) {
    bool value = context.watch<IntroProvider>().isAbsorb;
    return Provider.value(
      value: value,
      child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(" Terms of service ",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline)),
                      onTap: () {
                        context.read<IntroProvider>().setIsAbsorb();
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
              Flexible(
                child: AbsorbPointer(
                  absorbing: value,
                  child: Opacity(
                    opacity: value ? 0.5 : 1,
                    child: Column(
                      children: [
                        Expanded(
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
          )),
    );
  }
}
