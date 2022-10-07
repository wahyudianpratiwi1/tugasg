import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Auth/Signup.dart';
import 'package:mbech/page/Beranda/Data_ternak.dart';
import 'package:mbech/page/Homepage/Beranda.dart';
import 'package:mbech/page/Homepage/Dashboard.dart';
import 'package:mbech/page/Auth/forgot.dart';
import 'package:mbech/util/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbech/Services/Servlogin.dart';
import 'package:mbech/Services/Servverify.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Verif? verif;
  PostLogin? postLogin;
  Data? loginResponse = Data();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = false;
  //efek login
  bool isLoggedin = false;
  String? userId;
  late SharedPreferences sharedPref;
  _initSharedPreference() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  Future login() async {
    if (username.text == "" || password.text == "") {
      Fluttertoast.showToast(
          msg: "Email dan Password tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      //LOGIN
      postConnectToApi(
        username.text,
        password.text,
      ).then((value) {
        loginResponse = value;
        if (loginResponse != null) {
          String? token = loginResponse!.token;

          print("loginku: ${loginResponse!.token}");
          //VERIFY
          verify(token!).then((value) async {
            verif = value;
            print(loginResponse!.token);
            if (loginResponse!.token != null) {
              Navigator.pushNamed(context, '/dashboard');
            }
          });
        }
      });
    }
  }

  @override
  // void dispose() {
  //   username.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Silahkan Masuk",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
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
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
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
                          height: 50,
                          margin: const EdgeInsets.only(top: 20),
                          child: TextField(
                            obscureText: _passwordVisible ? false : true,
                            controller: password,
                            cursorColor: const Color.fromARGB(0, 0, 0, 0),
                            style: const TextStyle(color: Colors.black),
                            showCursor: true,
                            decoration: kTextFiledInputDecoration.copyWith(
                                labelText: "Kata sandi",
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
                          )),
                      Container(
                        width: 328,
                        height: 45,
                        margin: const EdgeInsets.only(top: 32),
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
                            "Masuk",
                            style: TextStyle(
                                fontFamily: 'poppins', color: Colors.white),
                          ),
                          onPressed: () async {
                            login();
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 200),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Forgot()));
                              },
                              child: const Text(
                                "Lupa Kata Sandi?",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff24408E)),
                              ))),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: const Text(
                                "Belum punya akun?",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/signup");
                                  },
                                  child: const Text(
                                    "Daftar",
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xff24408E)),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
