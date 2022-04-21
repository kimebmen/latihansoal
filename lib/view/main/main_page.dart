import 'package:flutter/material.dart';
import 'package:test1/constant/r.dart';
import 'package:test1/view/main/discussion/chat_page.dart';
import 'package:test1/view/main/latihan_soal/home_page.dart';
import 'package:test1/view/main/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String route = "main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pc = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(R.assets.icDiscuss,
          width: 40,),
        ),
        onPressed: () {
          // Navigator()
          // Navigator.of(context).pushNamed(ChatPage.route);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatPage(),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigation(),
      body: PageView(
        controller: _pc,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Container _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.06)),
      ]),
      child: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          index = 0;
                          _pc.animateToPage(index,
                              duration: Duration(milliseconds: 1),
                              curve: Curves.bounceInOut);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              R.assets.icHome,
                              height: 20,
                            ),
                            Text("Home"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Material(
                      child: InkWell(
                        child: Column(
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Image.asset(
                                R.assets.icHome,
                                height: 20,
                              ),
                            ),
                            Text("Diskusi"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          index = 1;
                          _pc.animateToPage(index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.bounceInOut);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.person),
                            Text("Profile"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
