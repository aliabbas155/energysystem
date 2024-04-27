import 'dart:async';

import 'package:energysystem/Screens/MainFunctionalities/aiRecomendation.dart';
import 'package:energysystem/Screens/MainFunctionalities/aiprediction.dart';
import 'package:energysystem/Screens/MainFunctionalities/allconsumptionhistory.dart';
import 'package:energysystem/Screens/MainFunctionalities/billgeneration.dart';
import 'package:energysystem/Screens/MainFunctionalities/realtime.dart';
import 'package:energysystem/Screens/MainFunctionalities/timeselectionforhistory.dart';
import 'package:energysystem/model/CategoryWidget.dart';
import 'package:energysystem/model/SliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required Key key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSlider();
    });
  }

  void _startSlider() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0XFF508BFF),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/images.png'),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Hello, Ali !",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Lora-VariableFont_wght.ttf',
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.notifications,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  right: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 172, 199, 218),
                          Color(0xFFE3F2FD),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/wattlogo.png',
                          width: 50.w,
                          height: 50.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'WATT',
                          style: TextStyle(
                            color: const Color(0XFFF6A300),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontFamily: 'Lora-VariableFont_wght.ttf',
                          ),
                        ),
                        Text(
                          'TRACK',
                          style: TextStyle(
                            color: const Color(0XFF508BFF),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontFamily: 'Lora-VariableFont_wght.ttf',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 240,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height - 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child:
                                SliderWidget(pageController: _pageController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Categories",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                mainAxisSpacing: 10.0, // Spacing between rows
                                crossAxisSpacing:
                                    10.0, // Spacing between columns
                              ),
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BillGeneration(),
                                        ),
                                      );
                                    }
                                    if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RealTimeConcumptions(),
                                        ),
                                      );
                                    }
                                    if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AllConsumptionHistoryScreen(),
                                        ),
                                      );
                                    }
                                    if (index == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AiPredicationScreen(),
                                        ),
                                      );
                                    }
                                    if (index == 4) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AiRecommendation(),
                                        ),
                                      );
                                    }
                                    if (index == 5) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Timeselectionforhistory(),
                                        ),
                                      );
                                    } else {
                                      // Handle other items if needed
                                    }
                                  },
                                  child: CategoryWidget(item: items[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> sliderImages = [
  'assets/images/onboarding1.jpg',
  'assets/images/onboardingscreenimagetwo.jpg',
  'assets/images/onboadingscreenimagethree.jpg',
];

final List<Map<String, dynamic>> items = [
  {
    'image': 'assets/images/ebill.png',
    'text': 'Generate Total Bill',
  },
  {
    'image': 'assets/images/consumption.png',
    'text': 'Real Time Consumption',
  },
  {
    'image': 'assets/images/history.png',
    'text': 'All Consumptions History',
  },
  {
    'image': 'assets/images/aibill.png',
    'text': 'Ai Prediction',
  },
  {
    'image': 'assets/images/recomendation.png',
    'text': 'Ai Recommendation',
  },
  {
    'image': 'assets/images/unit.png',
    'text': 'Unit Consumptions',
  },
];
