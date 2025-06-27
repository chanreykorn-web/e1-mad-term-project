import 'package:flutter/material.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
                Text(
                  "The below answer fits best for couple of words and not for a paragraph,",
                  style: TextStyle(fontSize: 15),
                ),

                // text fail login
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),

                // password
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(Icons.hide_source),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // makes full width
                  children: [
                    Text(
                      "Forget Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFfbfcfc),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.facebook,
                            size: 30,
                            color: Color(0xFF3498DB),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFfbfcfc),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.email,
                            size: 30,
                            color: Color(0xFFf5b041),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle login action here
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xff3498db),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, // makes full width
                  children: [
                    Text(
                      "Your account has been successfully created and is ready to use.",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
