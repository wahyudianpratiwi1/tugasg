import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbech/Services/Servaccount.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Account/Edit_image.dart';
import 'package:mbech/widgets/image_widget.dart';
import 'package:mbech/util/constant.dart';

import 'package:http/http.dart' as http;

class Management extends StatefulWidget {
  const Management({Key? key}) : super(key: key);

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  @override
  @override
  Widget build(BuildContext context) {
    setState(() {
      manage();
    });
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
          title: const Text(
            "Kembali",
            style: TextStyle(
                fontFamily: "poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff24408E)),
          ),
        ),
        body: manage());
  }
}

Widget manage() {
  return FutureBuilder(
      future: Usershared.getVerify(),
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          var verify = Verif.fromJson(jsonDecode(snapshot.data.toString()));
          print("Data verify : ${snapshot.data}");
          return FutureBuilder<User>(
              future: getUser(verify),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<Data>? data = snapshot.data?.data;
                  if (data != null) {
                    var image = json.encode(data[0].foto);
                    print("image : $image");
                    var image2 = json.decode(image);
                    print("image 2 : $image2");
                    return Column(children: <Widget>[
                      // InkWell(
                      //     onTap: () {
                      //       navigateSecondPage(const Editimage());
                      //     },
                      //     child: DisplayImage(
                      //       imagePath: user.image,
                      //       onPressed: () {},
                      //     )),
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${image2 == "https://be.gembala.sembadafarm.com/fotoprofil/null" ? "https://img.freepik.com/free-photo/photo-funny-sheep-animal-chewing-food-staring-camera_342744-434.jpg?size=626&ext=jpg&ga=GA1.2.30730343.1644423102" : image2}",
                                      scale: 1
                                      // snapshot.data.data[0].image,
                                      ),
                                  fit: BoxFit.fill))
                          // child: Image.network(
                          //     "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png"),
                          // decoration: BoxDecoration(
                          //   image: Image.network("${data[0].foto)",
                          //       fit: BoxFit.cover),
                          //   // borderRadius: BorderRadius.circular(10),
                          //   // color: Color.fromARGB(255, 255, 255, 255),
                          // ),
                          ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "${data[0].namaMitra}",
                          style:
                              bold.copyWith(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Username",
                                  style: semibold.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF24408E)),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Color(0xFF24408E),
                                      width: 1,
                                    ))),
                                    child: Text("${data[0].username}",
                                        style: semibold.copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        )))
                              ]),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Email",
                                  style: semibold.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF24408E)),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Color(0xFF24408E),
                                      width: 1,
                                    ))),
                                    child: Text("${data[0].email}",
                                        style: semibold.copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        )))
                              ]),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "No Hp",
                                  style: semibold.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF24408E)),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Color(0xFF24408E),
                                      width: 1,
                                    ))),
                                    child: Text("${data[0].noHp}",
                                        style: semibold.copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        )))
                              ]),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Alamat",
                                  style: semibold.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF24408E)),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Color(0xFF24408E),
                                      width: 1,
                                    ))),
                                    child: Text("${data[0].alamat}",
                                        style: semibold.copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        )))
                              ]),
                        ),
                      ),

                      // userinfodetail(user.peternakan, 'Nama Peternakan', const Editimage()),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff24408E)),
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Editimage(),
                                    settings: RouteSettings(arguments: [
                                      data[0].idUsers.toString(),
                                      data[0].namaMitra,
                                      data[0].username,
                                      data[0].alamat,
                                      data[0].noHp,
                                      data[0].email,
                                      data[0].foto,
                                    ])));
                          }),
                          child: Text("Ubah Profile"))
                    ]);
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}
