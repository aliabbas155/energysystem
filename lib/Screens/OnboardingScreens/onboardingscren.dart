import 'package:energysystem/Screens/RegistrationScreens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingPageView extends StatefulWidget {
  const BoardingPageView({super.key});

  @override
  _BoardingPageViewState createState() => _BoardingPageViewState();
}

class _BoardingPageViewState extends State<BoardingPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF508BFF),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0XFF508BFF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  buildPage(
                    image: 'assets/images/onboardingscreen1image.jpg',
                    title: 'Welcome to WATTTRACK!',
                    description:
                        "Friendly greeting introducing users to your electricity bill management app. It implies a user-centric focus, ",
                  ),
                  buildPage(
                    image: 'assets/images/onboardingscreenimagetwo.jpg',
                    title: 'Effortlessly Manage Your Bills',
                    description:
                        'Set reminders, view reports, and stay on top of your finances.',
                  ),
                  buildPage(
                    image: 'assets/images/onboadingscreenimagethree.jpg',
                    title: 'Managing bills from the couch!',
                    description:
                        'Stay on top of bills from home with your phone. Easy, convenient finance management without leaving your couch.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                3,
                (int index) {
                  return Container(
                    width: 13.0,
                    height: 13.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.black : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 200.w,
              height: 35.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 2) {
                    _pageController.animateToPage(
                      _currentPage + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  _currentPage == 2 ? 'Get Started' : 'Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(25),
              fontFamily: 'Oswald-VariableFont_wght.ttf',
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(17),
                fontFamily: 'Oswald-VariableFont_wght.ttf',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
