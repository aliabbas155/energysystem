import 'package:energysystem/Screens/RegistrationScreens/loginscreen.dart';
import 'package:flutter/material.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({super.key});

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF508BFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/images.png'),
                ),
              ),
              const SizedBox(height: 20),
              buildContainer("Privacy and Policy", Icons.security,
                  () => const LoginScreen()),
              const SizedBox(height: 20),
              buildContainer(
                  "Share App", Icons.share, () => const LoginScreen()),
              const SizedBox(height: 20),
              buildContainer(
                  "Rate This App", Icons.star, () => const LoginScreen()),
              const SizedBox(height: 20),
              buildContainer("About Us", Icons.info, () {}),
              const SizedBox(height: 20),
              buildContainer(
                  "Feedback", Icons.feedback, () => const LoginScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String title, IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 172, 199, 218),
              Color(0xFFE3F2FD),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Lora-VariableFont_wght.ttf',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(icon, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
