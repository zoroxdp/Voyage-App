import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:41041/api/v1/user";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginUrl = "$baseUrl/signin";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 200,
              height: 200,
              image: AssetImage('assets/images/Voyage.png'),
            ),
            const Text(
              "Login to Voyage",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    "Sign Up",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            txtfld("Email", emailController),
            const SizedBox(height: 16),
            txtfld("Password", passwordController),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: reqLogin,
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  void test() async {
    final response =
        await http.get(Uri.parse('http://localhost:41041/api/v1/blog/bulk'));
    print(response.body);
  }

  Future<String> reqLogin() async {
    final email = emailController.text;
    final password = passwordController.text;
    final body = {'email': email, 'password': password};
    print(body);
    print(body);
    final response =
        await http.post(Uri.parse(loginUrl), body: jsonEncode(body));
    print(response.body);
    return response.body;
  }

  TextField txtfld(email, controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: email,
        fillColor: const Color.fromARGB(155, 200, 235, 235),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
