import 'package:flutter/material.dart';
import 'station_owner_registration_page.dart';
import 'driver_registration_page.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Role selection
            ElevatedButton(
              onPressed: () {
                // Navigate to station owner registration form
                Navigator.push(context, MaterialPageRoute(builder: (context) => StationOwnerRegistrationPage()));
              },
              child: Text('Register as Station Owner'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to driver registration form
                Navigator.push(context, MaterialPageRoute(builder: (context) => DriverRegistrationPage()));
              },
              child: Text('Register as Driver'),
            ),
          ],
        ),
      ),
    );
  }
}
