import 'package:flutter/material.dart';
import 'registration_page.dart'; // Import RegistrationPage
import 'homePage.dart'; // Import HomePage
import 'ownerdashB.dart'; // Import OwnerDashboardPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform login logic here
                  // For simplicity, let's redirect to HomePage.dart for any login attempt
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                },
                child: Text('New User? Register Here'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerDashboardPage()));
                },
                child: Text('Station Owner Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
