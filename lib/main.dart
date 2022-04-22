import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/constant/r.dart';
import 'package:test1/view/auth/login_page.dart';
import 'package:test1/view/main/latihan_soal/home_page.dart';
import 'package:test1/view/main/latihan_soal/mapel_page.dart';
import 'package:test1/view/main/latihan_soal/paket_soal_page.dart';
import 'package:test1/view/main/main_page.dart';
import 'package:test1/view/auth/register_page.dart';
import 'package:test1/view/auth/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Soal',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.primary,
        ),
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
        MapelPage.route: (context) => const MapelPage(),
        PaketSoalPage.route: (context) => const PaketSoalPage(),
        // "main_page": (context) => const MainPage(),

        // RegisterPage.route:(context) => const RegisterPage(),
        // "/login":(context) => const LoginPage(),
        // "login_screen":(context) => const LoginPage(),
        // SplashScreen.route: (context) => const SplashScreen(),
      },
    );
  }
}
