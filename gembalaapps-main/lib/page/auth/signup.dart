import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbech/Services/Servsignup.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/util/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegistResponse? registResponse;
  PostRegister? postRegister;
  TextEditingController nama_mitra = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController no_hp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = false;

  Future signup() async {
    PostRegister.connectToApi(
      nama_mitra.text,
      username.text,
      email.text,
      no_hp.text,
      alamat.text,
      password.text,
    ).then((value) {
      registResponse = value;
      print(registResponse?.status.toString());
      // postRegister = value;
      // setState(() {});
      if (registResponse?.status == true) {
        Navigator.pushNamed(context, '/login');
      } else {
        Fluttertoast.showToast(
            msg: "${registResponse?.error}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    });
    // print(registResponse?.status);
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    //safearea digunakan agar tampilan lebih aman tidak tertutup screen yang menonjol kedalam
    return SafeArea(
        //gesturedetector ontap digunakan agar ketika ditap diluar dari inputan akan kembali ke tampilan awal
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 50),
                          child: const Text(
                            "Selamat Datang",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: const Image(
                          image: AssetImage("assets/image/mbek1.png"),
                          width: 150,
                          height: 145,
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: nama_mitra,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Nama Lengkap"),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: username,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Username"),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: email,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Email"),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: no_hp,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "No Handphone"),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: alamat,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Alamat"),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          obscureText: _passwordVisible ? false : true,
                          controller: password,
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: const TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Kata Sandi",
                              suffixIcon: IconButton(
                                icon: _passwordVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )),
                        ),
                      ),
                      Container(
                        width: 328,
                        height: 45,
                        margin: const EdgeInsets.only(top: 32, bottom: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF24408E),
                            onPrimary: Colors.white,
                            enabledMouseCursor:
                                MaterialStateMouseCursor.clickable,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Buat Akun",
                            style: TextStyle(
                                fontFamily: 'poppins', color: Colors.white),
                          ),
                          onPressed: () {
                            signup();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
