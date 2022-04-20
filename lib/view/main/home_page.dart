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
        child: Column(
          children: [
            _buildUserSection(),
            _buildBanner(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Pilih Mata Pelajaran"),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("Lihat Semua"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              color: R.colors.primary.withOpacity(0.5),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                R.assets.icAtom,
                                width: 26,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Matematika"),
                                  Text("0/50 Paket latihan soal"),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        height: 10,
                                        width: 100,
                                        color: R.colors.primary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildUserSection() {
    return Padding(
      padding: const EdgeInsets.all(21.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Kimebmen KimebmenKimebmenKimebmenKimebmenKimebmenKimebmenKimebmenKimebmenKimebmenKimebmenKimebmen",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text("Selamat Datang"),
              ],
            ),
          ),
          Image.asset(R.assets.imgUser, width: 35),
        ],
      ),
    );
  }

  Container _buildBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21.0),
      // padding: const EdgeInsets.all(21.0),
      height: 147,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: R.colors.primary,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Mau kerjain latihan soal apa hari ini?",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(R.assets.imgHome)),
          )
        ],
      ),
    );
  }
}