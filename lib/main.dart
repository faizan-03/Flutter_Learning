import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light, // Set the theme mode to dark
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily, // Use Lato font for the app
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        // Custom title text style
      ),
      // Use Google Fonts for the app
      darkTheme: ThemeData.dark(), // Use the default dark theme
      debugShowCheckedModeBanner: false, // Hide the debug banner

      initialRoute: '/home', // Set the initial route to Home widget
      title: 'Flutter Demo', // Set the title of the app

      routes: {
        '/': (context) => Home(), // Set the home route to Home widget
        '/login':
            (context) => LoginPage(), // Set the login route to LoginPage widget
        '/home': (context) => Home(), // Set the home route to Home widget
      },
    );
  }
}
