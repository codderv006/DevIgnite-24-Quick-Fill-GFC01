import 'package:flutter/material.dart';

class SlotBookingPage extends StatefulWidget {
  @override
  _SlotBookingPageState createState() => _SlotBookingPageState();
}

class _SlotBookingPageState extends State<SlotBookingPage> {
  // Define the available time slots
  List<String> timeSlots = [];

  // Define the available hourly intervals
  final List<String> hourlyIntervals = [
    '8:00 AM - 9:00 AM',
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 1:00 PM',
    '1:00 PM - 2:00 PM',
    '2:00 PM - 3:00 PM',
    '3:00 PM - 4:00 PM',
  ];

  String selectedHourlyInterval = '8:00 AM - 9:00 AM';

  @override
  void initState() {
    super.initState();
    updateTimeSlots(selectedHourlyInterval);
  }

  void updateTimeSlots(String hourlyInterval) {
    // Clear the existing time slots
    timeSlots.clear();

    // Define the start and end times for the selected hourly interval
    String startTime = hourlyInterval.split(' - ')[0];
    String endTime = hourlyInterval.split(' - ')[1];

    // Parse the start and end times to calculate the time slots
    int startHour = int.parse(startTime.split(':')[0]);
    int startMinute = int.parse(startTime.split(':')[1].split(' ')[0]);
    int endHour = int.parse(endTime.split(':')[0]);
    int endMinute = int.parse(endTime.split(':')[1].split(' ')[0]);

    // Generate the time slots with 10-minute intervals
    while (startHour < endHour ||
        (startHour == endHour && startMinute < endMinute)) {
      String slotStartTime = '$startHour:${startMinute.toString().padLeft(
          2, '0')}';
      startMinute += 10;
      if (startMinute >= 60) {
        startHour++;
        startMinute %= 60;
      }
      String slotEndTime = '$startHour:${startMinute.toString().padLeft(
          2, '0')}';
      timeSlots.add('$slotStartTime - $slotEndTime');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedHourlyInterval,
              onChanged: (newValue) {
                setState(() {
                  selectedHourlyInterval = newValue!;
                  updateTimeSlots(selectedHourlyInterval);
                });
              },
              items: hourlyIntervals.map((interval) {
                return DropdownMenuItem<String>(
                  value: interval,
                  child: Text(interval),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return ListView.builder(
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(timeSlots[index]),
                            trailing: timeSlots[index].contains('Booked')
                                ? ElevatedButton(
                              onPressed: () {
                                _showCancelBookingDialog(timeSlots[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                'Cancel Booking',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                                : ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(timeSlots[index]);
                              },
                              child: Text('Book'),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(String slot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Slot Booking'),
          content: Text('Are you sure you want to book the slot: $slot?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement booking functionality here
                // For demonstration, we are just updating the UI
                setState(() {
                  // Find the index of the selected slot
                  int slotIndex = timeSlots.indexOf(slot);
                  // Update the timeSlots list to mark the slot as booked
                  timeSlots[slotIndex] = 'Booked';
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
              ),
              child: Text(
                'Proceed',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCancelBookingDialog(String slot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Slot Booking'),
          content: Text(
              'Are you sure you want to cancel the booking for the slot: $slot?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement cancel booking functionality here
                // For demonstration, we are just updating the UI
                setState(() {
                  // Find the index of the selected slot
                  int slotIndex = timeSlots.indexOf(slot);
                  // Update the timeSlots list to mark the slot as available
                  timeSlots[slotIndex] = slot.replaceAll('Booked',
                      ''); // Replace "Booked" with the original time slot
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
              ),
              child: Text(
                'Yes, Cancel Booking',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ],
        );
      },
    );
  }
}
