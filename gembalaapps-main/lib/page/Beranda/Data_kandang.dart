import 'package:flutter/material.dart';
import 'package:mbech/Services/Servkandang.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Detail/Detail_kandang.dart';
import 'package:mbech/util/constant.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Datakandang extends StatefulWidget {
  const Datakandang({Key? key}) : super(key: key);

  @override
  State<Datakandang> createState() => _DatakandangState();
}

class _DatakandangState extends State<Datakandang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEFEFF2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFCC29),
          elevation: 1,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Data Kandang',
            style: semibold.copyWith(
                fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
                future: Usershared.getVerify(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    var verify =
                        Verif.fromJson(jsonDecode(snapshot.data.toString()));
                    print("Data verify : ${snapshot.data}");
                    return FutureBuilder<Kandang>(
                        future: getkandang(verify),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<Data>? data = snapshot.data?.data;
                            if (data != null) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                        height: 120,
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Detailkandang(),
                                                    settings: RouteSettings(
                                                        arguments:
                                                            data[index])),
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffE5E5E5),
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurStyle: BlurStyle.outer,
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 0,
                                                    blurRadius: 8,
                                                    offset: const Offset(0,
                                                        0), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                          "${data[index].namaKandang}",
                                                          style:
                                                              semibold.copyWith(
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xFF24408E),
                                                          )),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 50),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Berat Total",
                                                            style: semibold.copyWith(
                                                                color: Color(
                                                                    0xFF646464),
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            "${data[index].total_berat} kg",
                                                            style: semibold
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                            )));
                                  });
                            } else {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.9,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter: new ColorFilter.mode(
                                                  Color(0x00EFEFF2)
                                                      .withOpacity(0.5),
                                                  BlendMode.dstATop),
                                              image: AssetImage(
                                                  "assets/image/sad1.png"))),
                                    ),
                                    Text("Data Kandang kosong",
                                        style: medium.copyWith(
                                            fontSize: 25,
                                            color: Color.fromARGB(255, 0, 0, 0)
                                                .withOpacity(0.5))),
                                  ]);
                            }
                          }
                        });
                  } else {
                    Text("Data Kandang kosong");
                  }
                  return Container();
                })));
  }
}
