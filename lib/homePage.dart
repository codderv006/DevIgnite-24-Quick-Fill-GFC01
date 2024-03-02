import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<String> _imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  @override
  void initState() {
    super.initState();
    _startImageLoop();
  }

  void _startImageLoop() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imagePaths.length;
          _startImageLoop();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Fill'),
      ),
      body: Column(
        children: [
          // Image slides
          Container(
            height: 200,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0), // Start from right
                  end: Offset.zero, // End at the center
                ).animate(
                  CurvedAnimation(
                    parent: AnimationController(
                      vsync: this,
                      duration: Duration(milliseconds: 500),
                    )..forward(),
                    curve: Curves.easeInOut,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _imagePaths[_currentIndex],
                    key: ValueKey<String>(_imagePaths[_currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          // Section headline and subheading
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hassle-Free CNG Refill',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Select CNG station to book a slot to refill the tank',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 20),
          // First Card
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/map_icon.png',
                          height: 65,
                          width: 65,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Choose from map',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Find nearby stations on the map',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Second Card
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/station_list.png',
                          height: 65,
                          width: 65,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Choose from Station lists',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'View stations in a list format',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
