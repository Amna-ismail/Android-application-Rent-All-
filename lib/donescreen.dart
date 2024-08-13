import 'package:flutter/material.dart';
import 'homescreen.dart'; // Import the HomeScreen file

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: Color(0xFF00B8A8),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (String result) {
              // Handle navigation based on selection
              if (result == 'Sign Out') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Home',
                child: Text('Home'),
              ),

              const PopupMenuItem<String>(
                value: 'Categories',
                child: Text('Categories'),
              ),
              const PopupMenuItem<String>(
                value: 'Search',
                child: Text('Search'),
              ),
              const PopupMenuItem<String>(
                value: 'All Products',
                child: Text('All Products'),
              ),
              const PopupMenuItem<String>(
                value: 'Past Orders',
                child: Text('Past Orders'),
              ),
              const PopupMenuItem<String>(
                value: 'Recommendations',
                child: Text('Recommendations'),
              ),
              const PopupMenuItem<String>(
                value: 'Sign Out',
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your order has been confirmed',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'Thank you for your order!',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,


              ),
              SizedBox(height: 8.0),
              Text(
                'Pay through the given Easypaisa number of vendor!',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,

              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
