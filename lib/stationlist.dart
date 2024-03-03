import 'package:flutter/material.dart';
import 'slot_booking_page.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class StationList extends StatelessWidget {
  // Define the list of CNG stations
  final List<Map<String, dynamic>> cngStations = [
    {
      'name': 'HP Petrol Pump: N.H.T.C and CNG',
      'address': 'Address 1, City 1',
      'image': 'assets/pumpImage/stationIMG.jpg',
      'mapLink': 'https://maps.app.goo.gl/31yaN85Fa63EvTpRA',
      'cngLevel': 0.2, // Example cng level, range from 0.0 to 1.0
    },
    {
      'name': 'Hp petrol+ cng pump, Sindhi Society',
      'address': 'Address 2, City 2',
      'image': 'assets/pumpImage/stationIMG2.jpg',
      'mapLink': 'https://maps.app.goo.gl/7annw8UecMQUonif8',
      'cngLevel': 0.8,
    },
    {
      'name': 'Mahanagar Gas CNG Station, Patilwadi',
      'address': 'Address 3, City 3',
      'image': 'assets/pumpImage/stationIMG3.png',
      'mapLink': 'https://maps.app.goo.gl/8XaKUWe8siFjE2rg8',
      'cngLevel': 0.5,
    },
    {
      'name': 'Mahanagar Gas, Govandi East',
      'address': 'Address 4, City 4',
      'image': 'assets/pumpImage/stationIMG4.jpg',
      'mapLink': 'https://maps.app.goo.gl/nACb4p14fGgFBMv18',
      'cngLevel': 0.9,
    },
    {
      'name': 'Hement Karkare CNG Station',
      'address': 'Address 5, City 5',
      'image': 'assets/pumpImage/stationIMG5.jpg',
      'mapLink': 'https://maps.app.goo.gl/DA9Vt2D49Vb2Jw888',
      'cngLevel': 0.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Station List Page',
          style: TextStyle(fontSize: 24), // Adjust the font size here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cngStations.length,
          itemBuilder: (context, index) {
            // Extract station details
            final station = cngStations[index];
            final String name = station['name'];
            final String address = station['address'];
            final String image = station['image'];
            final double cngLevel = station['cngLevel'];

            // Determine color based on cng level
            Color cngColor;
            if (cngLevel < 0.3) {
              cngColor = Colors.red; // Low fuel
            } else if (cngLevel < 0.7) {
              cngColor = Colors.yellow; // Moderate fuel
            } else {
              cngColor = Colors.green; // Enough fuel
            }

            return Card(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Station Name
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Adjust the font size here
                      ),
                    ),
                  ),
                  // Station Image
                  Image.asset(image, height: 200, fit: BoxFit.cover),
                  // CNG Level
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Text('CNG Level: '),
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            color: cngColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Address
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Address: $address',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Open on Maps Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        // Open map link using flutter_web_browser
                        FlutterWebBrowser.openWebPage(
                          url: station['mapLink'],
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Colors.deepPurple,
                            secondaryToolbarColor: Colors.green,
                            navigationBarColor: Colors.amber,
                            addDefaultShareMenuItem: true,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                        );
                      },
                      child: Text('Open on Maps'),
                    ),
                  ),

                  // Book a Slot Button
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the SlotBookingPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SlotBookingPage()),
                        );
                      },
                      child: Text('Book a Slot'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
