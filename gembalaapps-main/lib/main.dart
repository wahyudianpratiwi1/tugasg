import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Account/Edit_image.dart';
import 'package:mbech/page/Auth/Forgot.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/Auth/Onboarding.dart';
import 'package:mbech/page/Auth/Signup.dart';
import 'package:mbech/page/Beranda/Data_ternak.dart';
import 'package:mbech/page/Detail/Detail_pakan.dart';
import 'package:mbech/page/Detail/Detail_perkawinan.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:mbech/page/Homepage/Beranda.dart';
import 'package:mbech/page/Homepage/Dashboard.dart';
import 'package:mbech/page/Homepage/Jelajah.dart';
import 'package:mbech/page/Homepage/Profile.dart';
import 'package:mbech/page/Homepage/Trading.dart';
import 'package:mbech/Services/Servlogin.dart';
import 'package:mbech/page/account/dash_account.dart';
import 'package:mbech/page/account/management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gembala",
      home: Login(),
      routes: {
        '/login': (BuildContext context) => const Login(),
        '/dashboard': (BuildContext context) => const Dashboard(),
        '/signup': (BuildContext context) => const Signup(),
        '/Forgot': (BuildContext context) => const Forgot(),
        '/Beranda': (BuildContext context) => const Beranda(),
        '/Jelajah': (BuildContext context) => Jelajah(),
        '/Profile': (BuildContext context) => const Profile(),
        '/Trading': (BuildContext context) => const Trading(),
        '/Data_ternak': (BuildContext context) => const Dataternak(),
        '/Detail_perkawinan': (BuildContext context) =>
            const DetailPerkawinan(),
        '/Detail_ternak': (BuildContext context) => const Detailternak(),
        '/detail_pakan': (BuildContext context) => const detailPakan(),
        '/management': (BuildContext context) => const Management(),
        '/Dashaccount': (BuildContext context) => const Dashaccount(),
        '/Editimage': (BuildContext context) => const Editimage(),
      },
    );
  }
}
