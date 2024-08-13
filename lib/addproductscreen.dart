import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'homescreen.dart'; // Import the HomeScreen file

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? _selectedCategory;
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'Home':
      // Navigate to Home
        break;
      case 'All Item':
      // Navigate to Categories
        break;
      case 'Add Item':
      // Navigate to Search
        break;
      case 'Orders':
      // Navigate to All Products
        break;
      case 'Earnings':
      // Navigate to Past Orders
        break;
      case 'Sign Out':
      // Navigate to Sign Out screen
        Navigator.of(context).pushReplacementNamed('/signout');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
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
                value: 'All Item',
                child: Text('All Item'),
              ),
              const PopupMenuItem<String>(
                value: 'Add Item',
                child: Text('Add Item'),
              ),
              const PopupMenuItem<String>(
                value: 'Orders',
                child: Text('Orders'),
              ),
              const PopupMenuItem<String>(
                value: 'Earnings',
                child: Text('Earnings'),
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the item';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Image',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  color: Colors.grey[200],
                  height: 200,
                  child: _image == null
                      ? Center(child: Text('Tap to select image', style: TextStyle(color: Colors.black)))
                      : Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(_image!, fit: BoxFit.cover),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 16,
                            child: Icon(Icons.close, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                items: <String>[
                  'Jewelry',
                  'Books',
                  'Furniture',
                  'Electronics',
                  'Dresses',
                  'House',
                  'Vehicle'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value.toLowerCase(),
                    child: Text(value, style: TextStyle(color: Colors.grey)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                value: _selectedCategory,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Rent (per day)',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rent per day';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product added successfully')),
                    );
                    _formKey.currentState!.reset();
                    setState(() {
                      _image = null;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
