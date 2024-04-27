import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;
  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController = TextEditingController();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.black,
      Color(0XFFF6A300),
      Color(0XFF508BFF),
    ];
    var colorizeTextStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.sp);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0, // Remove elevation
        backgroundColor: const Color(0XFF508BFF),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0XFF508BFF),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                width: 400.w,
                height: 550.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 172, 199, 218),
                      Color(0xFFE3F2FD),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 250.0,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'Join the community!! Sign up',
                              textStyle: colorizeTextStyle,
                              colors: colorizeColors,
                            ),
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/images.png'),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextFieldContainer(
                                  child: TextField(
                                    controller: _firstNameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person),
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                  hintTextStyle: 'Your custom hint style here',
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _buildTextFieldContainer(
                                  child: TextField(
                                    controller: _lastNameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person),
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                  hintTextStyle: 'Your custom hint style here',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildTextFieldContainer(
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.phone),
                                hintText: 'Enter phone number',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            hintTextStyle: 'Your custom hint style here',
                          ),
                          const SizedBox(height: 20),
                          _buildTextFieldContainer(
                            child: TextField(
                              controller: _addressController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.location_on),
                                hintText: 'Enter your address',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            hintTextStyle: 'Your custom hint style here',
                          ),
                          const SizedBox(height: 20),
                          _buildTextFieldContainer(
                            child: TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                hintText: 'enter you password',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            hintTextStyle: 'Your custom hint style here',
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                text: 'Register',
                                onPressed: () {},
                                color: const Color(0XFFF6A300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 200.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5, // Add elevation for box shadow
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

Widget _buildTextFieldContainer(
    {required Widget child, required String hintTextStyle}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: child,
  );
}
