import 'package:flutter/material.dart';
import 'package:mbech/util/constant.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff24408E),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Kembali",
            style: semibold.copyWith(
                fontSize: 16, color: const Color(0xff24408E))),
      ),
      body: Center(
          child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Masukkan email yang anda daftarkan pada gembala app",
                  style: regular.copyWith(
                      fontSize: 12, color: const Color(0xff24408E)),
                ),
              ),
              Container(
                child: Text(
                  " dan periksa pesan masuk atau spam",
                  style: regular.copyWith(
                      fontSize: 12, color: const Color(0xff24408E)),
                ),
              ),
              Container(
                width: 140,
                height: 235,
                margin: const EdgeInsets.only(top: 32),
                child:
                    const Image(image: AssetImage("assets/image/forgot.png")),
              ),
              Container(
                width: 328,
                height: 50,
                margin: const EdgeInsets.only(top: 50),
                child: TextField(
                  cursorColor: const Color.fromARGB(0, 0, 0, 0),
                  style: const TextStyle(color: Colors.black),
                  showCursor: true,
                  decoration:
                      kTextFiledInputDecoration.copyWith(labelText: "Email"),
                ),
              ),
              Container(
                width: 329,
                height: 45,
                margin: const EdgeInsets.only(top: 32, bottom: 50),
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
                      "Kirim",
                      style:
                          TextStyle(fontFamily: 'poppins', color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              )
            ],
          ),
        ),
      )),
    );
  }
}
