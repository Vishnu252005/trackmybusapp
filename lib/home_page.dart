import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> buses = [
    {'number': 'B101', 'status': 'On Time', 'location': 'Downtown'},
    {'number': 'B202', 'status': 'Delayed', 'location': 'Uptown'},
    {'number': 'B303', 'status': 'On Time', 'location': 'Central Park'},
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // You can add navigation logic here for different pages
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track My Bus'),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          // Simulated Map Section
          Container(
            margin: EdgeInsets.all(16),
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.blue[100]!, Colors.green[100]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(Icons.map, size: 100, color: Colors.blue[300]),
            ),
          ),
          // Route Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.green),
                title: Text('From: Downtown'),
                subtitle: Text('To: Central Park'),
                trailing: Icon(Icons.directions_bus, color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 16),
          // Bus List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: buses.length,
              itemBuilder: (context, index) {
                final bus = buses[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[700],
                      child: Icon(Icons.directions_bus, color: Colors.white),
                    ),
                    title: Text('Bus ${bus['number']}'),
                    subtitle: Text('Location: ${bus['location']}'),
                    trailing: Text(
                      bus['status'],
                      style: TextStyle(
                        color: bus['status'] == 'On Time'
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add navigation or refresh logic here
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue[800],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Buses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
