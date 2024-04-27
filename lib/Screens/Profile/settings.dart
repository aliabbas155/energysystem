import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switchValue1 = false;
  final bool _isDarkMode = false;

  Widget _buildUserProfileWidget(
      {required String text, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: _isDarkMode
              ? Colors.black
              : Colors.grey.shade100), // Conditional container color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: _isDarkMode
                  ? Colors.white
                  : Colors.black, // Conditional text color
            ),
          ),
          Icon(
            icon,
            color: _isDarkMode
                ? Colors.white
                : Colors.black, // Icon color based on dark mode
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Material(
          elevation: 6,
          child: Container(
            decoration: BoxDecoration(
                color: _isDarkMode ? Colors.black : Colors.grey.shade100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(width: 80.w),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 105.w,
                            height: 45.h,
                            color: const Color(0XFF2D85B9),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 90.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: _isDarkMode
                                      ? Colors.black
                                      : Colors.grey.shade100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 80.w,
                              height: 25.h,
                              color: const Color(0XFF2D85B9),
                              child: const Center(
                                  child: Text(
                                "Wattrack",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          _buildUserProfileWidget(
              text: 'Device Update', icon: Icons.arrow_forward_ios_rounded),
          const SizedBox(height: 5),
          const SizedBox(height: 5),
          _buildUserProfileWidget(
              text: 'Privacy Setting', icon: Icons.arrow_forward_ios_rounded),
          const SizedBox(height: 5),
          _buildUserProfileWidget(
              text: 'Temperature Unit', icon: Icons.arrow_forward_ios_rounded),
          const SizedBox(height: 5),
          _buildUserProfileWidget(
              text: 'More Features', icon: Icons.arrow_forward_ios_rounded),
          const SizedBox(height: 5),
          _buildUserProfileWidget(
              text: 'Language', icon: Icons.arrow_forward_ios_rounded),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: _isDarkMode ? Colors.black : Colors.grey.shade100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'App Notification',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _isDarkMode ? Colors.white : Colors.black),
                ),
                Switch(
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.blue,
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(() {
                      _switchValue1 = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
