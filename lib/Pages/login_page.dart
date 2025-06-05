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
  bool togglePasswordVisibility = true; // For password visibility toggle
  final _formKey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Validate the form
      setState(() {
        changebutton = true;
      });
      _logger.info('Login button pressed');
      await Future.delayed(Duration(milliseconds: 900));
      if (!mounted) {
        return; //  Check if the widget is still mounted
      }
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_HCS.png',
                  fit: BoxFit.cover,
                  height: 250,
                  width: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'WELCOME TO HCS ${name ?? ''}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null; // Return null if the input is valid
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
                        obscureText:
                            togglePasswordVisibility, // control visibility
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              togglePasswordVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                togglePasswordVisibility =
                                    !togglePasswordVisibility;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 29), // Add some space between fields

                      InkWell(
                        onTap: () => movetoHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
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
      ),
    );
  }
}
