import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'splash.dart';
import 'customerlogin.dart';
import 'customersignup.dart';
import 'vendorsignup.dart';
import 'vendorlogin.dart';
import 'homescreen.dart';
import 'searchscreen.dart'; // Import the search screen
import 'borrowscreen.dart';
import 'donescreen.dart'; // Import your DoneScreen widget


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const CustomerLogin(),
        '/customersignup': (context) => const CustomerSignup(),
        '/vendorsignup': (context) => const VendorSignup(),
        '/searchscreen': (context) => const SearchScreen(),
        '/search': (context) => const SearchScreen(),
        '/borrow':  (context) => BorrowScreen(productName: '', productImage: '', vendor: '', city: '', quantity: '', category: '', contact: '',),
        '/donescreen': (context) => DoneScreen(), // Add DoneScreen route
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        AndroidLarge16(),
      ]),
    );
  }
}

class AndroidLarge16 extends StatelessWidget {
  const AndroidLarge16({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 439,
                  height: 800,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 800,
                          decoration: const BoxDecoration(color: Color(0xFF2CB6A9)),
                        ),
                      ),
                      Positioned(
                        left: 105,
                        top: 300,  // Adjusted top position for the image
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,  // Adjust the width of the image container
                              height: 150, // Adjust the height of the image container
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/2.PNG'),  // Replace with your image path
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle, // Adjust the shape as needed
                              ),
                            ),
                            const SizedBox(height: 20), // Added space between image and text
                            SizedBox(
                              width: 334,
                              height: 99,
                              child: Text(
                                'RENT ALL',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontFamily: 'Inika',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
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
      ],
    );
  }
}
