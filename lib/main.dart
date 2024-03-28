import 'package:flutter/material.dart';
import 'acc/LoginPage.dart';
import 'Screens/HomePage.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _isLoggedIn = false; // Track user's login state

  @override
  Widget build(BuildContext context) {
    // Check if user is logged in or not
    if (_isLoggedIn) {
      // If logged in, navigate to home page
      return MyHomePage(); // Replace with your home page
    } else {
      // If not logged in, navigate to login page
      return LoginPage();
    }
  }
}
