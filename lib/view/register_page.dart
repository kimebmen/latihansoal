import 'package:flutter/material.dart';
import 'package:test1/constant/r.dart';
import 'package:test1/view/login_page.dart';
import 'package:test1/view/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String route = "register_page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controller = TextEditingController();
  List<String> classSlta = [
    "10", "11", "12",
    // "Gap Year", "Umum"
  ];
  String? selectedClass = "10";
  String? gender = "";
  final emailController = TextEditingController();

  onTapGender(Gender genderInput) {
    if (genderInput == Gender.lakiLaki) {
      gender = "Laki-laki";
    } else {
      gender = "Perempuan";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Yuk isi data diri",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 36),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.blue,
                fixedSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: R.colors.primary)),
              ),
              onPressed: () {
                print(emailController.text);
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => MainPage(),
                //   ),
                // );
                // Navigator.of(context).pushNamed(MainPage.route);
                Navigator.of(context).pushNamedAndRemoveUntil(MainPage.route, (context)=>false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DAFTAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterTextField(
                controller: emailController,
                title: 'Email',
                hintText: 'Email Anda',
              ),

              RegisterTextField(
                title: 'Nama Lengkap',
                hintText: 'contoh : Kimebmen Simbolon',
              ),

              //JK
              Text(
                "Jenis Kelamin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  // Laki-laki
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Laki-laki"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.lakiLaki);
                        },
                        child: Text(
                          "Laki-laki",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Laki-laki"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == "Perempuan"
                              ? R.colors.primary
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: R.colors.greyBorder,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTapGender(Gender.perempuan);
                        },
                        child: Text(
                          "Perempuan",
                          style: TextStyle(
                            fontSize: 14,
                            color: gender == "Perempuan"
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              // Kelas
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kelas",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: (14),
                      // vertical: (5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(
                        color: R.colors.greyBorder,
                      ),
                    ),
                    // height: 50,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        hint: Text(
                          "Pilih kelas",
                          style: TextStyle(
                            color: Color(0XFFAAAAAA),
                          ),
                        ),
                        items: classSlta
                            .map(
                              (e) => DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        value: selectedClass,
                        onChanged: (String? val) {
                          selectedClass = val!;
                          setState(() {});
                          // validation();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              RegisterTextField(
                title: 'Nama Sekolah',
                hintText: 'Nama Sekolah',
              ),
              // Spacer(),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
  }) : super(key: key);
  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: R.colors.greyBorder,
            ),
          ),
          height: 50,
          child: TextField(
            controller: controller,
            // enabled: false,
            decoration: InputDecoration(
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: R.colors.greyHintText,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
