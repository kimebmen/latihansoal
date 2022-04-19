import 'package:flutter/material.dart';
import 'package:test1/constant/r.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String route = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: R.colors.primary,
                ),
                height: 130,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Mau kerjain latihan apa hari ini?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation: Offset(0.04, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/img_home.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
