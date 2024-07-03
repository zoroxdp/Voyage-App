import 'package:flutter/material.dart';

import 'pages/login_screen.dart';
import 'pages/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Material(
        child: Scaffold(
          backgroundColor: Colors.cyan,
          body: LoginScreen(),
        ),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen()
      },
    );
  }
}
