import 'dart:async';

import 'package:energysystem/Screens/OnboardingScreens/onboardingscren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BoardingPageView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil in the build method
    ScreenUtil.init(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOver,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/splachim.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(70),
            left: ScreenUtil().setWidth(10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Empowering Your ",
                    style: TextStyle(
                      color: const Color(0XFF2D85B9),
                      fontSize: ScreenUtil().setSp(40),
                      fontFamily: 'Oswald-VariableFont_wght.ttf',
                    ),
                  ),
                  TextSpan(
                    text: "\nEnergy Efficiency ",
                    style: TextStyle(
                      color: const Color(0xFFFCEFDF),
                      fontSize: ScreenUtil().setSp(40),
                      fontFamily: 'Oswald-VariableFont_wght.ttf',
                    ),
                  ),
                  TextSpan(
                    text: "\nJourney",
                    style: TextStyle(
                      color: const Color(0XFF2D85B9),
                      fontSize: ScreenUtil().setSp(40),
                      fontFamily: 'Oswald-VariableFont_wght.ttf',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(50),
            left: ScreenUtil().setWidth(90),
            child: Text(
              "Welcome to WattCheck!",
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
                fontSize: ScreenUtil().setSp(16),
                fontFamily: 'Oswald-VariableFont_wght.ttf',
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(80),
            right: ScreenUtil().setWidth(150),
            child: SizedBox(
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(80),
              child: LoadingAnimationWidget.dotsTriangle(
                color: const Color(0XFF2D85B9),
                size: 55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
