import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package for TextInputFormatter
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiRecommendation extends StatefulWidget {
  const AiRecommendation({super.key});

  @override
  State<AiRecommendation> createState() => _AiRecommendationState();
}

class _AiRecommendationState extends State<AiRecommendation> {
  final TextEditingController _morningController = TextEditingController();
  final TextEditingController _eveningController = TextEditingController();
  final TextEditingController _nightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 50),
                child: Text(
                  'Recommended Consumption Values',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  'Our state-of-the-art AI model is suggesting you the following rate of daily consumption',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    const Text('Morning'),
                    SizedBox(width: 60.h),
                    const Text('Evening'),
                    SizedBox(width: 60.h),
                    const Text('Night'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: _morningController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: _eveningController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: _nightController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: _buildCalculateButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return SizedBox(
      height: 40.h,
      width: 300.w,
      child: ElevatedButton(
        onPressed: () {
          // Print entered values
          print('Morning: ${_morningController.text}');
          print('Evening: ${_eveningController.text}');
          print('Night: ${_nightController.text}');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF508BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Calculate',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontFamily: 'Lora-VariableFont_wght.ttf',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 0.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 172, 199, 218),
              Color(0xFFE3F2FD),
            ],
          ),
          borderRadius: BorderRadius.circular(10.0),
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
    );
  }
}
