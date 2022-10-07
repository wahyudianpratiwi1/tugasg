import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mbech/data/Trading.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/Beranda/Data_pakan.dart';
import 'package:mbech/page/Beranda/Data_ternak.dart';
import 'package:mbech/util/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class Pemdetailpembayaran extends StatefulWidget {
  const Pemdetailpembayaran({Key? key}) : super(key: key);

  @override
  State<Pemdetailpembayaran> createState() => _PemdetailpembayaranState();
}

class _PemdetailpembayaranState extends State<Pemdetailpembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEFEFF2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFCC29),
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail Transaksi',
            style: semibold.copyWith(
                fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 16, right: 16, top: 17, bottom: 10),
                      width: 400,
                      // height: 440,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xffE5E5E5),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 15),
                                child: Text("Katamso Farm",
                                    style: semibold.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 15, top: 15),
                                  child: statuskonfirmasi()),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Berat Total",
                                      style: regular.copyWith(
                                          color: Color(0xFF646464),
                                          fontSize: 14),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "100",
                                          style: semibold.copyWith(),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "kg",
                                          style: semibold.copyWith(),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 7, left: 20, right: 20),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "X",
                                          style: medium.copyWith(
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                        Text(
                                          "4",
                                          style: medium.copyWith(
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Rp ",
                                          style: semibold,
                                        ),
                                        Text(
                                          "50.000",
                                          style: semibold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            child: Column(children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 10),
                              height: 187,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 0.2)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 4),
                                      child: Text("Item",
                                          style: semibold.copyWith(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          )),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 15, top: 16),
                                                      child: Text(
                                                        "999999",
                                                        style: medium.copyWith(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Text(
                                                      "-",
                                                      style: medium.copyWith(
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      "Texel",
                                                      style: medium.copyWith(
                                                          fontSize: 12),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 30, right: 5),
                                                        child: Text("180 Kg",
                                                            style:
                                                                medium.copyWith(
                                                              fontSize: 12,
                                                            ))),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30, right: 15),
                                                      child: Text(
                                                        "Rp 50.000",
                                                        style: medium.copyWith(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                  ])),
                        ])),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width,
                          // height: 22,
                          decoration: BoxDecoration(
                            color: Color(0xFFD2D2D2),
                          ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text("4",
                                          style: medium.copyWith(fontSize: 12)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text("Domba",
                                          style: medium.copyWith(fontSize: 12)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text("Total Pesanan",
                                          style:
                                              semibold.copyWith(fontSize: 12)),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 10),
                                      child: Text("Rp 10.000.000",
                                          style: semibold.copyWith(
                                              fontSize: 12,
                                              color: Color(0xFF24408E))),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 20),
                                child: Text(
                                  "Upload Bukti Pembayaran (PNG/JPG Max. 1 Mb) ",
                                  style: semibold.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 10, top: 5),
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(Icons.add_a_photo),
                              ),
                            ]),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF0EAF00)),
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Datapakan()));
                                      }),
                                      child: Text(
                                        "Unggah Dokumen",
                                        style: medium.copyWith(fontSize: 16),
                                      ))),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 16, right: 16),
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF24408E)),
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dataternak()));
                                      }),
                                      child: Text(
                                        "Hubungi Penjual",
                                        style: medium.copyWith(fontSize: 16),
                                      ))),
                            ],
                          ),
                        ),
                      ])))
            ]));
  }
}
