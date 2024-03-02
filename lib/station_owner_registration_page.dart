import 'package:flutter/material.dart';
import 'homePage.dart';
class StationOwnerRegistrationPage extends StatefulWidget {
  @override
  _StationOwnerRegistrationPageState createState() => _StationOwnerRegistrationPageState();
}

class _StationOwnerRegistrationPageState extends State<StationOwnerRegistrationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _stationNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _substationQuantityController = TextEditingController();
  TextEditingController _attendantsCountController = TextEditingController();
  TextEditingController _avgCNGPressureController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Station Owner Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneNumberController,
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
            TextField(
              controller: _stationNameController,
              decoration: InputDecoration(
                labelText: 'Station Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _substationQuantityController,
              decoration: InputDecoration(
                labelText: 'Substation Quantity',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _attendantsCountController,
              decoration: InputDecoration(
                labelText: 'Attendants Count',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _avgCNGPressureController,
              decoration: InputDecoration(
                labelText: 'Avg CNG Pressure',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                // Access the entered values using the controllers
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
