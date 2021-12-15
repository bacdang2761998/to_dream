import 'package:dream/app_other/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _controller = PageController(
      initialPage: 0,
    );
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
          title: Text(
            "Support",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 2,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              this.selectedIndex = index;
                            });
                          },
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          children: [
                            customPage(AppString.CONTENT1),
                            customPage(AppString.CONTENT2),
                            customPage(AppString.CONTENT3),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: imagePage())
            ],
          ),
        ));
  }

  Widget customPage(String content) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }

  Widget imagePage() {
    if (this.selectedIndex == 0) {
      return Image.asset("assets/images/help.png");
    } else if (this.selectedIndex == 1) {
      return Image.asset("assets/images/background.png");
    } else {
      return Image.asset("assets/images/splash.png");
    }
  }
}
