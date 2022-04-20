import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/view/auth/login_page.dart';
import 'package:test1/view/main/home_page.dart';
import 'package:test1/view/main/main_page.dart';
import 'package:test1/view/auth/register_page.dart';
import 'package:test1/view/auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen(),
      initialRoute: "/",
      // initialRoute: SplashScreen.route,
      // initialRoute: "splash_screen",
      routes: {
        "/": (context) => const SplashScreen(),
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        MainPage.route: (context) => const MainPage(),
        HomePage.route: (context) => const HomePage(),
        // "main_page": (context) => const MainPage(),

        // RegisterPage.route:(context) => const RegisterPage(),
        // "/login":(context) => const LoginPage(),
        // "login_screen":(context) => const LoginPage(),
        // SplashScreen.route: (context) => const SplashScreen(),
        
      },
    );
  }
}