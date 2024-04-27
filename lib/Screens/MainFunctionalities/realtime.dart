import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RealTimeConcumptions extends StatelessWidget {
  const RealTimeConcumptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Customize arrow color here
          ),
          onPressed: () {
            // Define what happens when back arrow is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
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
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Real Time Checking',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: CircularPercentIndicator(
                radius: MediaQuery.of(context).size.height * .125,
                lineWidth: 5.0,
                animation: true,
                animationDuration: 2000,
                percent: 0.8,
                widgetIndicator: const Icon(
                  Icons.circle_outlined,
                  color: Color(0XFF508BFF),
                  size: 20,
                ),
                center: const CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage('assets/images/circleunit.png'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '33000',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Watt Per Hours',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Real Time',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0XFF508BFF),
              ),
            ),
            const SizedBox(height: 50),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircularConsumptionIndicator(
                    title: 'Voltage (V)',
                    value: '3345',
                    unit: 'Watt Per Hours',
                    progressColor: const Color(0XFF508BFF),
                    context: context,
                  ),
                  const SizedBox(width: 5),
                  _buildCircularConsumptionIndicator(
                    title: 'Frequency (F)',
                    value: '1280',
                    unit: 'Hertz Per Hour',
                    progressColor: const Color(0XFF508BFF),
                    context: context,
                  ),
                  const SizedBox(width: 5),
                  _buildCircularConsumptionIndicator(
                    title: 'Current (Amp)',
                    value: '9897',
                    unit: 'Ampere Per Hour',
                    progressColor: const Color(0XFF508BFF),
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularConsumptionIndicator({
    required String title,
    required String value,
    required String unit,
    required Color progressColor,
    required BuildContext context,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          const SizedBox(height: 10),
          CircularPercentIndicator(
            radius: 60,
            lineWidth: 5.0,
            animation: true,
            animationDuration: 4000,
            percent: 0.8,
            widgetIndicator: Icon(
              Icons.circle_outlined,
              color: progressColor,
              size: 13,
            ),
            center: CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/images/circleunit.png'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "REAL TIME ",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progressColor,
          ),
        ],
      ),
    );
  }
}
