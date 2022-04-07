import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Image.asset(
          "assets/auth/ic_splash.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
      backgroundColor: Color(0xff3A7FD5),
    );
  }
}
