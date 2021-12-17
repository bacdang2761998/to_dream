import 'dart:io';
import 'package:dream/screen/account/account_model.dart';
import 'package:dream/screen/account/account_provider.dart';
import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/help/help_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  final account = Account();

  final DateTime _dateNow = DateTime.now();
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<AccountProvider>(context, listen: false).getAccountInfo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Time Line',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.help,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 5),
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: Text(
                "${_dateNow.year} Year ${_dateNow.month} Month ${_dateNow.day} Day ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    timeLineView(context: context),
                    timeLineAddView(context: context)
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
                      count: 2,
                      effect: const WormEffect(
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
        ));
  }

  Widget timeLineView({required BuildContext context}) {
    final value = context.watch<AccountProvider>();
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          '${value.account?.year ?? '0'} Year',
          style: TextStyle(fontSize: 24),
        ),
        TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 28.86),
            duration: Duration(milliseconds: 700),
            builder: (BuildContext context, double value, child) {
              return Text(
                "${value.toStringAsFixed(2)} Point",
                style: TextStyle(color: Colors.blue, fontSize: 36),
              );
            }),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: CircularPercentIndicator(
            lineWidth: 10,
            radius: size.width * 0.8,
            percent: 0.7,
            center: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    context.watch<AccountProvider>().account?.name ?? '',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: checkImage(value.account?.avataAccount)
                      ? ClipOval(
                          child: Image.file(
                            File(value.account!.avataAccount!),
                            fit: BoxFit.cover,
                            height: size.width / 3,
                            width: size.width / 3,
                          ),
                        )
                      : Icon(
                          Icons.account_circle_outlined,
                          size: 100,
                          color: Colors.blue,
                        ),
                )
              ],
            ),
            progressColor: Colors.green,
            animation: true,
          ),
        )
      ]),
    );
  }

  bool checkImage(String? path) {
    if (path != null && path.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Widget timeLineAddView({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Text("0 Year", style: TextStyle(fontSize: 24)),
            Text(
              "0 Point",
              style: TextStyle(color: Colors.blue, fontSize: 36),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: CircularPercentIndicator(
                lineWidth: 10,
                radius: size.width * 0.7,
                percent: 1.0,
                center: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.white, blurRadius: 50, spreadRadius: 10)
                  ]),
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
                progressColor: Colors.grey,
                animation: true,
                animateFromLastPercent: true,
              ),
            )
          ]),
        ),
        Opacity(
          opacity: 0.5,
          child: Container(
            color: Colors.grey,
            height: double.infinity,
            width: double.infinity,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 100,
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateAccount())),
            ),
          ),
        ),
      ],
    );
  }
}
