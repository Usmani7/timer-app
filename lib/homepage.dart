
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timerstatus = 0;
    CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeDetector(
            onSwipeUp: () {
                        print('changed');
        setState(() {
            timerstatus = 1;
        });
    },
              child: Container(
          decoration: BoxDecoration(
                    color: Color(0xffffd93e),
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.11), BlendMode.dstATop),
              fit: BoxFit.cover
              ,
            )
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15)),
              Text('Session 1',
              style: GoogleFonts.firaSans(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
              ),
              ),
              Padding(padding: EdgeInsets.all(23.0)),
            (timerstatus == 0) ?
              startWidget()
            : (timerstatus == 1) ?
             runningWidget() 
             : completedWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text('JOBDESk',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFFFFFF)
                      )
                      )
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget startWidget() {
    return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Swipe up to start Timer',
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.bold,
              fontSize: 24,
             color: Color(0xff707070)
            ),
          ),
          Container(
            height: 138,
            width: 126,
            child: Image.asset(
              'images/tooth.png'
            ),
          ),
          Container()
        ],
      ),
    );
  }



    Widget runningWidget() {
    return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Countdown',
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.bold,
              fontSize: 24,
             color: Color(0xff707070)
            ),
          ),
          Container(
            height: 138,
            width: 126,
            child: Image.asset(
              'images/tooth.png'
            ),
          ),
          CircularCountDownTimer(
        duration: 60,
        controller: _controller,
        width: 208,
        height: 208,
        fillColor: Colors.white70,
        color: Color(0xff0074CD),
        backgroundColor: null,
        strokeWidth: 20.0,
        textStyle: GoogleFonts.firaSans(
            fontSize: 30.0, color: Color(0xff0074CD)
            ),
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        onComplete: () {
                    setState(() {
            timerstatus = 3;
          });
        },
      ),
          Text('Total Time: 1 minute',
          style: GoogleFonts.firaSans(
            color: Color(0xff000000),
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
          Container()
        ],
      ),
    );
  }

    Widget completedWidget() {
    return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Countdown',
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.bold,
              fontSize: 24,
             color: Color(0xff707070)
            ),
          ),
          Container(
            height: 138,
            width: 126,
            child: Image.asset(
              'images/tooth.png'
            ),
          ),
          Container(
            height: 230,
            child: Center(
              child: Text(
                'Thankyou!',
                style: GoogleFonts.firaSans(
                  fontSize: 37.0,
                  color: Color(0xff02AD58),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(),
          Container()
        ],
      ),
    );
  }
  
}