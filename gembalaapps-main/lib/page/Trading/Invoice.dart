import 'package:flutter/material.dart';
import 'package:mbech/page/Homepage/Trading.dart';
import 'package:mbech/util/constant.dart';
import 'package:intl/intl.dart';
import 'package:mbech/page/Trading/Keranjang.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  getCurrentDate() {
    return DateFormat('dd-MM-yyyy / kk:mm').format(DateTime.now());
  }

  final duplicateItems = List<String>.generate(3, (i) => "Item $i");
  var items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefeff2),
      appBar: AppBar(
        backgroundColor: Color(0xFF24408E),
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Invoice",
            style: semibold.copyWith(
                fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Dari :",
                              style: semibold.copyWith(
                                  fontSize: 14, color: Color(0xFF646464))),
                          Text("Sembada Farm",
                              style: semibold.copyWith(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Dibuat untuk :",
                              style: semibold.copyWith(
                                  fontSize: 14, color: Color(0xFF646464))),
                          Text("Katamso Farm",
                              style: semibold.copyWith(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  width: 300,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 15),
                  color: Colors.black,
                ),
                Container(
                  height: 1,
                  width: 360,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 9),
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("Invoice Detail",
                      style: semibold.copyWith(
                          fontSize: 16, color: Color(0xFF000000))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("Email",
                      style: semibold.copyWith(
                          fontSize: 14, color: Color(0xFF646464))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, left: 20),
                  child: Text("Katamsofarm.oke@gmail.com",
                      style: semibold.copyWith(
                          fontSize: 14, color: Color(0xFF000000))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("Tanggal Keluar",
                      style: semibold.copyWith(
                          fontSize: 14, color: Color(0xFF646464))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, left: 20),
                  child: Text("${getCurrentDate()}",
                      style: semibold.copyWith(
                          fontSize: 14, color: Color(0xFF000000))),
                ),
                SizedBox(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                      fontSize: 16, color: Color(0xFF646464))),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 15,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              style:
                                                  medium.copyWith(fontSize: 12),
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
                                              style:
                                                  medium.copyWith(fontSize: 12),
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
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFF000000))),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      child:
                                          Text("Total Berat", style: medium)),
                                  Container(
                                      margin: EdgeInsets.only(right: 5, top: 5),
                                      child: Text("720 kg", style: medium)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 10, top: 5, bottom: 10),
                                      child:
                                          Text("Total Harga", style: medium)),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 5, top: 5, bottom: 10),
                                    child: Text(
                                      "Rp 180.000",
                                      style: medium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      // width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff24408E)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Trading()));
                          },
                          child: Text(
                            "Send Email",
                            style: semibold,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
