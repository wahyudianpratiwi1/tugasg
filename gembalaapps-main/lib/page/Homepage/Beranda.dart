import 'package:flutter/material.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/Beranda/Data_kandang.dart';
import 'package:mbech/page/Beranda/Data_kesehatan.dart';
import 'package:mbech/page/Beranda/Data_pakan.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Beranda/Data_ternak.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Beranda/Data_perkawinan.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  Verif? verify;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            child: SingleChildScrollView(
      child: Center(
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 30),
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/dash2.png"))),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/dash1.png"))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: const Text(
                      "Halo,",
                      style: semibold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    child: FutureBuilder(
                        future: Usershared.getVerify(),
                        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                          if (snapshot.data != null) {
                            var verify = Verif.fromJson(
                                jsonDecode(snapshot.data.toString()));
                            print("Data verify : ${snapshot.data}");
                            return Text(
                              "${verify.name}",
                              style: bold,
                            );
                          }
                          return Text("Guest");
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
            ),
          ]),
          Container(
              // margin: EdgeInsets.only(top: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF24408E),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dataternak()))),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: const Center(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/mbek3.png")),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 20,
                              width: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                "Ternak",
                                style: bold.copyWith(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF24408E),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Datakandang()))),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/cage.png")),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 20,
                                    width: 90,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Text(
                                      "Kandang",
                                      style: bold.copyWith(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ])),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFF24408E),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Datapakan()))),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/image/plant.png")),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 20,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Pakan",
                                    style: bold.copyWith(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFF24408E),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Datakesehatan()))),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 6),
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/syringe.png")),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 3),
                                        height: 20,
                                        width: 90,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Kesehatan",
                                          style: bold.copyWith(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ])),
          Container(
              // margin: EdgeInsets.only(top: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF24408E),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dataperkawinan()))),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: const Center(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/gender.png")),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 20,
                              width: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                "Perkawinan",
                                style: bold.copyWith(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 2,
                            //   color: const Color(0xFF24408E),
                            // ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("")),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 20,
                                    width: 90,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Text(
                                      "",
                                      style: bold.copyWith(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ])),
        ]),
      ),
    )));
  }
}
