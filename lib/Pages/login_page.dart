import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('LoginPage');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  String? name = '';
  bool changebutton = false;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/Alumnii_logo.png',
                fit: BoxFit.cover,
                height: 250,
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'WELCOME TO HCS ${name ?? ''}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {
                          _logger.info('Username changed to: $name');
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Enter your username',
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
                    SizedBox(height: 29), // Add some space between fields

                    InkWell(
                      onTap: () async {
                        setState(() {
                          changebutton = true;
                        });
                        _logger.info('Login button pressed');
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changebutton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            changebutton ? 50 : 10,
                          ),
                          gradient:
                              changebutton
                                  ? LinearGradient(
                                    colors: [
                                      Colors.deepOrange,
                                      Colors.deepOrangeAccent,
                                    ],
                                  )
                                  : null,
                          color: Colors.deepPurple,
                        ),
                        child:
                            changebutton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      ),
                    ),

                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: 50,
                    //       vertical: 15,
                    //     ),
                    //     minimumSize: Size(150, 50),
                    //     textStyle: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     _logger.info('Login button pressed');
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text('Login'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
