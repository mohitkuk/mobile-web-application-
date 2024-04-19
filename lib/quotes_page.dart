import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  String quoteText = "Loading...";
  String quoteAuthor = "Unknown";

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
      if (response.statusCode == 200) {
        List<dynamic> quotes = json.decode(response.body);
        quotes.shuffle();
        if (quotes.isNotEmpty) {
          final randomQuote = quotes[0];
          setState(() {
            quoteText = randomQuote['text'] ?? "Unknown";
            quoteAuthor = randomQuote['author'] ?? "Unknown";
          });
        } else {
          setState(() {
            quoteText = "No quotes available";
            quoteAuthor = "Unknown";
          });
        }
      } else {
        setState(() {
          quoteText = "Failed to load quote";
          quoteAuthor = "Unknown";
        });
      }
    } catch (error) {
      setState(() {
        quoteText = "Error fetching quote";
        quoteAuthor = "Unknown";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Quotes')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Today\'s Quote:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '"$quoteText"',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- $quoteAuthor',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchQuote,
                child: Text('Get Another Quote'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
