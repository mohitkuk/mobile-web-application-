import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greeting')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Daily Inspiration!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Changed text color to blue
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24), // Increased vertical space
              ClipRRect(
                borderRadius: BorderRadius.circular(12), // Rounded corners for the image
                child: Image.asset(
                  'assets/image.jpeg', // Replace with the correct path
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
