// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScreenWelcome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url = Uri.parse("https://demo.chanreykorn.com/api/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": _usernameController.text.trim(),
          "password": _passwordController.text.trim(),
        }),
      );

      setState(() {
        _isLoading = false;
      });

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print("Response keys: ${data.keys}");
        print("Username in response: ${data['user']?['username']}");

        String? username;

        if (data.containsKey('user')) {
          username = data['user']?['username'];
        } else if (data.containsKey('data')) {
          username = data['data']?['username'];
        } else if (data.containsKey('username')) {
          username = data['username'];
        }

        if (username != null && username.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Successful! Welcome $username"),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenWelcome(username: username!),
            ),
          );
        } else {
          setState(() {
            _errorMessage = "Login succeeded, but username is missing.";
          });
        }
      } else {
        final errorBody = jsonDecode(response.body);
        setState(() {
          _errorMessage =
              errorBody['message'] ?? "Login failed. Check credentials.";
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "An error occurred: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Welcome back! Please enter your login credentials.",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.red),
                ),
              ),

              const SizedBox(height: 20),

              if (_errorMessage != null)
                Text(_errorMessage!, style: TextStyle(color: Colors.red)),

              GestureDetector(
                onTap: _isLoading ? null : _login,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Color(0xff3498db),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
