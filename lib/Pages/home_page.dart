import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: unused_field, prefer_final_fields
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
      drawer: MyDrawer(), // Optional: Add a Drawer widget if needed
    );
  }
}
