import 'package:flutter/material.dart';

class AffirmationsPage extends StatelessWidget {
  final List<Map<String, String>> affirmations = [
    {'imagePath': 'assets/affirmation1.jpeg', 'text': 'I am powerful and resilient.'},
    {'imagePath': 'assets/affirmation2.jpeg', 'text': 'I radiate confidence and grace.'},
    {'imagePath': 'assets/affirmation3.jpeg', 'text': 'I attract positive energy into my life.'},
    {'imagePath': 'assets/affirmation4.jpeg', 'text': 'I am surrounded by love and abundance.'},
    {'imagePath': 'assets/affirmation5.jpeg', 'text': 'I am capable of achieving my goals.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Affirmations'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: affirmations.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return AffirmationCard(
            imagePath: affirmations[index]['imagePath']!,
            text: affirmations[index]['text']!,
          );
        },
      ),
    );
  }
}

class AffirmationCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const AffirmationCard({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners for card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)), // Rounded top corners for image
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Affirmation:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
