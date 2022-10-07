import 'package:flutter/material.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/data/Trading.dart';

class Diproses extends StatefulWidget {
  const Diproses({Key? key}) : super(key: key);

  @override
  State<Diproses> createState() => _DiprosesState();
}

class _DiprosesState extends State<Diproses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCC29),
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Detail Penjualan",
            style: semibold.copyWith(
                fontSize: 16, color: Color.fromARGB(255, 0, 0, 0))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Color(0xFF1F960B),
                      ),
                      Text("Terima", style: bold.copyWith(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.cancel,
                        size: 60,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      Text("Tolak", style: bold.copyWith(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
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
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Text("Katamso Farm",
                              style: semibold.copyWith(
                                color: Color(0xFF24408E),
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 15, top: 15),
                            child: statusdiproses()),
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
                                    color: Color(0xFF646464), fontSize: 14),
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
                        margin: EdgeInsets.only(top: 7, left: 20, right: 20),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFF000000))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10, bottom: 5),
                                child: Text("Items",
                                    style: semibold.copyWith(
                                        fontSize: 16,
                                        color: Color(0xFF646464))),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 5),
                                                child: Text(
                                                  "999999",
                                                  style: medium.copyWith(
                                                      fontSize: 12),
                                                )),
                                            Text(
                                              " - ",
                                              style:
                                                  medium.copyWith(fontSize: 12),
                                            ),
                                            Text(
                                              "Texel",
                                              style:
                                                  medium.copyWith(fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 5),
                                              child: Text(
                                                "180",
                                                style: medium.copyWith(
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Text(
                                              "kg",
                                              style:
                                                  medium.copyWith(fontSize: 12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 5),
                                              child: Text(
                                                "Rp 180.000",
                                                style: medium.copyWith(
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 6),
                      width: MediaQuery.of(context).size.width,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(210, 210, 210, 1),
                        border: Border.lerp(
                            Border(
                                top: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            Border(
                                bottom: BorderSide(
                                    color: Color(0xFF000000), width: 0.5)),
                            0.5),
                      ),
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
                                    style: semibold.copyWith(fontSize: 12)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 10),
                                child: Text("Rp 10.000.000",
                                    style: semibold.copyWith(
                                        fontSize: 12,
                                        color: Color(0xFF24408E))),
                              )
                            ],
                          )
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD2D2D2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text("Status Pembayaran :",
                                    style: medium.copyWith(fontSize: 12)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 8, right: 10),
                                child: Text("Belum Dibayar",
                                    style: semibold.copyWith(
                                        fontSize: 12,
                                        color: Color(0xFFB01B1B))),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
