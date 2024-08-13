import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'donescreen.dart'; // Import DoneScreen widget
import 'dart:io';
import 'homescreen.dart'; // Import the HomeScreen file
class BorrowScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final String vendor;
  final String city;
  final String quantity;
  final String category;
  final String contact;

  const BorrowScreen({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.vendor,
    required this.city,
    required this.quantity,
    required this.category,
    required this.contact,
  }) : super(key: key);

  @override
  _BorrowScreenState createState() => _BorrowScreenState();
}

class _BorrowScreenState extends State<BorrowScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String? cnicFrontImagePath;
  String? cnicBackImagePath;

  Future<void> _pickImage(ImageSource source, bool isFront) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          if (isFront) {
            cnicFrontImagePath = pickedFile.path;
          } else {
            cnicBackImagePath = pickedFile.path;
          }
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked); // Format as needed
      });
    }
  }

  void _confirmOrder() {
    // Implement form submission logic

    // Navigate to DoneScreen on successful submission
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DoneScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrow ${widget.productName}'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  widget.productImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Product Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),

              ),
              SizedBox(height: 8.0),

              Text('Name: ${widget.productName}',style: TextStyle(color: Colors.black)),
              Text('Vendor: ${widget.vendor}',style: TextStyle(color: Colors.black)),
              Text('City: ${widget.city}',style: TextStyle(color: Colors.black)),
              Text('Quantity: ${widget.quantity}',style: TextStyle(color: Colors.black)),
              Text('Category: ${widget.category}',style: TextStyle(color: Colors.black)),
              Text('Contact: ${widget.contact}',style: TextStyle(color: Colors.black)),
              SizedBox(height: 16.0),
              Text(
                'Name *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                'How many days?',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Enter number of days',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                'Borrowing From *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                readOnly: true,
                controller: startDateController,
                onTap: () {
                  _selectDate(startDateController);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Select borrowing start date',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                'Borrowing To *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                readOnly: true,
                controller: endDateController,
                onTap: () {
                  _selectDate(endDateController);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Select borrowing end date',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                'CNIC Number *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your CNIC number',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                'Upload CNIC Front side Image *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              if (cnicFrontImagePath != null)
                Image.file(
                  File(cnicFrontImagePath!),
                  height: 150,
                ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery, true); // Select from gallery for front image
                },
                child: Text('Upload'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Upload CNIC Back side Image *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              if (cnicBackImagePath != null)
                Image.file(
                  File(cnicBackImagePath!),
                  height: 150,

                ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery, false); // Select from gallery for back image
                },
                child: Text('Upload'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Phone *',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _confirmOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    child: Text('Confirm',
                    style: TextStyle(color: Colors.white),
                    ),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate back to previous screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    child: Text
                      ('Cancel',
                    style: TextStyle(color: Colors.white),
                    ),
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
