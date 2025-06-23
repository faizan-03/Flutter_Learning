import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/cart_page.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/starter.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  _setupLogging(); // Set up logging for the app
  runApp(VxState(store: MyStore(), child: MyApp()));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
      '${record.level.name}: ${record.time}: ${record.message} : ${record.loggerName}',
    );
  });
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
      // initialRoute: '/', // Set the initial route to Home widget
      title: 'Flutter Demo', // Set the title of the app
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.starterRoute:
            (context) => Starter(), // Set the home route to Starter widget
        MyRoutes.loginRoute:
            (context) => LoginPage(), // Set the login route to LoginPage widget
        MyRoutes.homeRoute:
            (context) => Homepage(), // Set the home route to Homepage widget
        MyRoutes.cartRoute: (context) => CartPage(), // Set the cart route
      },
    );
  }
}
