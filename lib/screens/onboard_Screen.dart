import 'dart:async';

import 'package:clot_app/screens/Login_Screen.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    super.initState();
    // ClotProvider().getCategories().then(
    //       (value) => Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => const logininScreen(),
    //           )),
    //     );
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const logininScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8E6CEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/AppLogo.png',
              scale: 2,
              color: Colors.white,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
