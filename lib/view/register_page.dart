import 'package:flutter/material.dart';
import 'package:test1/constant/r.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  List<String> classSlta = ["10", "11", "12", "Gap Year", "Umum"];
  String? kelas = "10";
  String? gender = "";

  setGender(Gender type) {
    if (type == Gender.lakiLaki) {
      gender = "Laki-laki";
    } else {
      gender = "Perempuan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Yuk isi data diri",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Nama Lengkap",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFD6D6D6),
                ),
              ),
              height: 50,
              child: const TextField(
                // controller: nameController,
                // enabled: false,
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "Nama Lengkap",
                  hintStyle: TextStyle(
                    color: Color(0XFFAAAAAA),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            //JK
            Text(
              "Jenis Kelamin",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Laki-laki
                GestureDetector(
                  onTap: () {
                    setGender(Gender.lakiLaki);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: gender == "Laki-laki"
                          ? R.colors.primary
                          : Colors.white,
                      border: Border.all(
                        color: gender == "Laki-laki"
                            ? R.colors.primary
                            : Color(0XFFD6D6D6),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: (32),
                      vertical: (12),
                    ),
                    child: Text(
                      "Laki-Laki",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                            gender == "Laki-laki" ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // Perempuan
                GestureDetector(
                  onTap: () {
                    setGender(Gender.perempuan);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: gender == "Perempuan"
                          ? R.colors.primary
                          : Colors.white,
                      border: Border.all(
                        color: gender == "Perempuan"
                            ? R.colors.primary
                            : Color(0XFFD6D6D6),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: (32),
                      vertical: (12),
                    ),
                    child: Text(
                      "Perempuan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                            gender == "Perempuan" ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Kelas
            SizedBox(height: 10),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: (16),
                    vertical: (5),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0XFFD6D6D6),
                    ),
                  ),
                  height: 50,
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
                      .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                      .toList(),
                      value: kelas,
                      onChanged: (String? val) {
                        kelas = val;
                        setState(() {});
                        // validation();
                      },

                    ),
                  ),
                ),
              ],
            ),

            //Button
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Color(0xff3A7FD5),
                  fixedSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                  ),
                ),
                onPressed: () {
                  print(nameController.text);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const RegisterPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("assets/auth/ic_apple.png"),
                    const SizedBox(width: 10),
                    const Text(
                      "Daftar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
