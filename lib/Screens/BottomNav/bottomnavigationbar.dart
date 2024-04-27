import 'package:energysystem/Screens/HomeScreen/HomeScreen.dart';
import 'package:energysystem/Screens/Profile/profilemanagement.dart';
import 'package:energysystem/Screens/Profile/settings.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class WelcomeScreenUser extends StatefulWidget {
  const WelcomeScreenUser({super.key});

  @override
  _WelcomeScreenUserState createState() => _WelcomeScreenUserState();
}

class _WelcomeScreenUserState extends State<WelcomeScreenUser> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _listOfWidget,
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: const Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.event,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.settings,
            title: 'Settings',
          ),
          BarItem(
            icon: Icons.person_2_outlined,
            title: 'About',
          ),
        ],
      ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  HomeScreen(key: UniqueKey()),
  const Settings(),
  const UserProfile(),
];
