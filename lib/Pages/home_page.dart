import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isHovering = false; // Variable to track hover state for the close icon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Color.fromARGB(255, 96, 179, 212),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Cross sign to close the drawer
            Align(
              alignment: Alignment.topRight,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovering = true),
                onExit: (_) => setState(() => _isHovering = false),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: _isHovering ? Colors.red : Colors.black,
                    size: 30,
                  ),
                  splashColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
            ),
            // Spacer
            SizedBox(height: 20),
            // Logout button
            ElevatedButton(
              onPressed: () {
                // Add your logout logic here
                Navigator.popAndPushNamed(
                  context,
                  MyRoutes.starterRoute,
                ); // Close the drawer after logout
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ), // Optional: Add a Drawer widget if needed
    );
  }
}
