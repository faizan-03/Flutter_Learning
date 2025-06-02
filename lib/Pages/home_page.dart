import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var day2 = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: const Color.fromARGB(255, 96, 179, 212),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: Text(
            'Hello, World! \nWelcome to $day2 days of Flutter.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(), // Optional: Add a Drawer widget if needed
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 223, 11, 184),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navigate to LoginPage
              },
            ),
          ],
        ),
      ),
    );
  }
}
