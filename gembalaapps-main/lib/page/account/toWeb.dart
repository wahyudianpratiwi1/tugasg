import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mbech/util/constant.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class toWeb extends StatefulWidget {
  const toWeb({Key? key}) : super(key: key);

  @override
  State<toWeb> createState() => _toWebState();
}

class _toWebState extends State<toWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF24408E),
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 119, 119, 119),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail Dashboard',
            style: semibold.copyWith(
                fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 10),
          // height: 150,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Untuk Masuk Kedalam Dashboard",
                  style: semibold.copyWith(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Silahkan Ikuti Langkah Dibawah Ini!",
                  style: semibold.copyWith(
                      fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "1. Copy Link dibawah ini dan buka pada browser",
                  style: semibold.copyWith(
                      fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "https://gembala.sembadafarm.com/",
                  style: semibold.copyWith(
                      fontSize: 12, color: Color.fromARGB(255, 72, 97, 224)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "2. Kemudian Login dengan akun yang telah dibuat pada aplikasi",
                  style: semibold.copyWith(
                      fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3. Kemudian Isi Data Ternak",
                  style: semibold.copyWith(
                      fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          ),
        ));
  }
}
