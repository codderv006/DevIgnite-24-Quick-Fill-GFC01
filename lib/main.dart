import 'package:flutter/material.dart';
import 'landing_page.dart'; // Import LandingPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNG Refilling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Your theme data
      ),
      home: LandingPage(), // Set landing page as home
    );
  }
}
