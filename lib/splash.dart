import 'package:flutter/material.dart';
import 'dart:async';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AndroidLarge16(),
      ),
    );
  }
}

class AndroidLarge16 extends StatelessWidget {
  const AndroidLarge16({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the size of the device screen
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: const BoxDecoration(color: Color(0xFF2CB6A9)),
            ),
          ),
          Positioned(
            left: screenSize.width / 2 - 75,  // Adjusted for center alignment
            top: screenSize.height / 2 - 125, // Adjusted for center alignment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/2.PNG'),  // Replace with your image path
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'RENT ALL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inika',
                    fontWeight: FontWeight.bold,
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
