import 'package:flutter/material.dart';
import 'package:mbech/data/Trading.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_pembayaran.dart';
import 'package:mbech/util/constant.dart';

class Trxpembelian extends StatefulWidget {
  const Trxpembelian({Key? key}) : super(key: key);

  @override
  State<Trxpembelian> createState() => _TrxpembelianState();
}

class _TrxpembelianState extends State<Trxpembelian> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 170,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pemdetailpembayaran()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                  ),
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
                        offset:
                            const Offset(0, 0), // changes position of shadow
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
                                child: statusmenunggu()),
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
                        child: Center(
                            child: Text("Tampilkan Domba Lainnya",
                                style: medium.copyWith(fontSize: 10))),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color(0xFFD2D2D2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
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
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ));
        });
  }
}
