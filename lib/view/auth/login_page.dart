import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/constant/r.dart';
// import 'package:test1/view/main_page.dart';
import 'package:test1/view/auth/register_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState(); // ?
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f7f8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  R.strings.login,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(R.assets.imgLogin),
              SizedBox(height: 35),
              Text(
                R.strings.welcome,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                R.strings.loginDescription,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: R.colors.greySubtitle,
                ),
                // TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w500,
                //   color: R.colors.greySubtitle,
                // ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
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
                  onPressed: () async {
                    await signInWithGoogle();
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      Navigator.of(context).pushNamed(RegisterPage.route);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Gagal Masuk"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const RegisterPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/auth/ic_google.png"),
                      const SizedBox(width: 10),
                      const Text(
                        "Masuk dengan Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.black,
                    fixedSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: R.colors.primary)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/auth/ic_apple.png"),
                      SizedBox(width: 10),
                      Text(
                        "Masuk dengan Apple",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
