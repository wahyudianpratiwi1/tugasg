import 'package:flutter/material.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/auth/signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), //Color(0xFFF7F3EA
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                child:
                    const Image(image: AssetImage("assets/image/GEMBALA.png"))),
            Container(
              padding: const EdgeInsets.only(top: 200, bottom: 10),
              child: const Text(
                "Selamat Datang",
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            Container(
              width: 264,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF24408E),
                  onPrimary: Colors.white,
                  enabledMouseCursor: MaterialStateMouseCursor.clickable,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Mulai",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: const Text(
                  "Belum punya akun?",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()));
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff24408E)),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
