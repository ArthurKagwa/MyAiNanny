import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Show splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate the splash screen effect
    Timer(Duration(seconds: 2), () {
      // Navigate to the main page (AiNannyPage) after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AiNannyPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // You can replace this container with your splash screen design
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/My AI Nanny.jpg', // Replace with the actual path to your logo
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

class AiNannyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Nanny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFE65C00),
        ),
      ),
      home: AiNannyHomePage(),
    );
  }
}

class AiNannyHomePage extends StatefulWidget {
  @override
  _AiNannyHomePageState createState() => _AiNannyHomePageState();
}

class _AiNannyHomePageState extends State<AiNannyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Nanny'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to AI Nanny',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'My AI Nanny is a company that keeps track of a baby using a smart wristband and sends information about the baby to the mother\'s app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildMenuItem(
                    Icons.child_care,
                    'Baby Info',
                    () {
                      // Add functionality for baby information
                    },
                  ),
                  buildMenuItem(
                    Icons.chat,
                    'Chat Bot',
                    () {
                      // Add functionality for chat bot
                    },
                  ),
                  buildMenuItem(
                    Icons.lightbulb_outline,
                    'Tips',
                    () {
                      // Add functionality for tips
                    },
                  ),
                  buildMenuItem(
                    Icons.payment,
                    'Payment',
                    () {
                      // Add functionality for payment
                    },
                  ),
                ],
              ),
              // Rest of your code remains unchanged
              // ...
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.child_friendly),
            label: 'Feeding',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Prescriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Hardware Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'SOS',
          ),
        ],
        selectedItemColor: Colors.orange, // Set the selected item color
        unselectedItemColor: Colors.grey, // Set the unselected item color
        backgroundColor: Colors.white, // Set the background color
      ),
      drawer: AiNannyDrawer(),
    );
  }

  Widget buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 40,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AiNannyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE65C00),
            ),
            child: Text(
              'Ai Nanny Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text('Statistics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Change Account'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Hospitals'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HospitalsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change Profile Picture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Add functionality to change profile picture
              },
              child: Text('Select New Picture'),
            ),
            SizedBox(height: 16),
            Text(
              'Add Phone Number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Change Phone Number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter New Phone Number',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter New Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save changes
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sample Statistics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Heart Rate: ${generateRandomData(60, 160)} bpm',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Temperature: ${generateRandomData(96.0, 100.0)}°F',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pulse: ${generateRandomData(70, 120)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Noise in Decibels: ${generateRandomData(50, 100)} dB',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Movement Rate: ${generateRandomData(0, 10)} per minute',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Location: (${generateRandomData(-90, 90)}, ${generateRandomData(-180, 180)})',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  double generateRandomData(double min, double max) {
    return min +
        (max - min) * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000;
  }
}

class HospitalsPage extends StatelessWidget {
  final List<String> hospitals = [
    'Kibuli Hospital',
    'Mulago Hospital',
    'Case Clinic',
    'Novik Hospital', /* Add more hospitals here */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals'),
      ),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hospitals[index]),
            // Add functionality to handle hospital selection
          );
        },
      ),
    );
  }
}
