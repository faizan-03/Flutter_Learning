import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 96, 179, 212),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Alumnii_logo.png',
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'WELCOME TO ALUMNII',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 20), // Add some space between fields
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter your password',
                    ),
                  ),
                  SizedBox(height: 20), // Add some space between fields
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      print('Login button pressed');
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
