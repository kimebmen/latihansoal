import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Login"),
          Image.asset("asset/auth/img_login.png"),
          Text(""),
          Text()
        ],
      ),
      
    );
  }
}