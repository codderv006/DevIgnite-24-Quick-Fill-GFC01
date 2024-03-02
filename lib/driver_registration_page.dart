import 'package:flutter/material.dart';
import 'homePage.dart'; // Import your home page

class DriverRegistrationPage extends StatefulWidget {
  @override
  _DriverRegistrationPageState createState() => _DriverRegistrationPageState();
}

class _DriverRegistrationPageState extends State<DriverRegistrationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _selectedVehicleType; // Declare as nullable

  List<String> _vehicleTypes = ['Car/Small Truck', 'Auto', 'Truck'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedVehicleType,
              items: _vehicleTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? value) { // Accept nullable value
                setState(() {
                  _selectedVehicleType = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Vehicle Type',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                // Access the entered values using _nameController.text, _phoneController.text, _emailController.text, and _selectedVehicleType

                // After successful registration, navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
