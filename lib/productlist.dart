import 'package:flutter/material.dart';
import 'borrowscreen.dart';
import 'homescreen.dart'; // Import the HomeScreen file
class ProductList extends StatelessWidget {
  final String city;

  const ProductList({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration purposes
    final List<Map<String, String>> products = [
      {

        'name': 'Dining Table',
        'image': 'assets/images/img.png',
        'city': 'Rawalpindi',
        'quantity': '01',
        'category': 'Furniture',
        'vendor': 'Amna',
        'contact': '123-456-7890',
      },
      {
        'name': 'Office Furniture',
        'image': 'assets/images/img_1.png',
        'city': 'Rawalpindi',
        'quantity': '01',
        'category': 'Furniture',
        'vendor': 'Irum',
        'contact': '123-456-7891',
      },
      {
        'name': 'Chopper',
        'image': 'assets/images/img_2.png',
        'city': 'Rawalpindi',
        'quantity': '01',
        'category': 'Electronics',
        'vendor': 'Amna',
        'contact': '123-456-7890',
      },
      {
        'name': 'Dress',
        'image': 'assets/images/img_3.png',
        'city': 'Rawalpindi',
        'quantity': '01',
        'category': 'Dress',
        'vendor': 'Ayesha',
        'contact': '034-452-7864',
      },



    ];

    // Filter products by city
    final List<Map<String, String>> filteredProducts = products.where((product) {
      return product['city']!.toLowerCase() == city.toLowerCase();
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Products in $city'),
        backgroundColor: const Color(0xFF00B8A8),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.grey,
            child: ListTile(
              leading: Image.asset(
                product['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']!,
              style: TextStyle(color: Colors.black),

              ),// Set text color to black
              subtitle: Text(
                'City: ${product['city']}\n'
                    'Quantity: ${product['quantity']}\n'
                    'Category: ${product['category']}\n'
                    'Vendor: ${product['vendor']}\n'
                    'Contact: ${product['contact']}',
                style: TextStyle(color: Colors.black), // Set text color to black
              ),

              trailing: ElevatedButton(
                onPressed: () {
                  // Handle borrow button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BorrowScreen(
                        productName: product['name']!,
                        productImage: product['image']!,
                        vendor: product['vendor']!,
                        city: product['city']!,
                        quantity: product['quantity']!,
                        category: product['category']!,
                        contact: product['contact']!,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Borrow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
