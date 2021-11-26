import 'package:dream/screen/account/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

final DateTime _dateNow = DateTime.now();
final _controller = PageController(
  initialPage: 0,
);

class _TimeLineScreenState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          child: Text(
              "${_dateNow.year} Year ${_dateNow.month} Month ${_dateNow.day} Day "),
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
    ));
  }

  Widget timeLineView({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.01,
      ),
      Text("100 Year"),
      Text(
        "28.8 Point",
        style: TextStyle(color: Colors.blue, fontSize: 32),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: CircularPercentIndicator(
          radius: size.width * 0.8,
          percent: 0.7,
          center: Icon(
            Icons.person_pin,
            size: 50.0,
            color: Colors.blue,
          ),
          progressColor: Colors.green,
          animation: true,
        ),
      )
    ]);
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
            Text("0 Year"),
            Text(
              "0 Point",
              style: TextStyle(color: Colors.blue, fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: CircularPercentIndicator(
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
