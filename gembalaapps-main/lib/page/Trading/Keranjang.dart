import 'package:flutter/material.dart';
import 'package:mbech/util/constant.dart';
import 'Invoice.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
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
          title: Text("Keranjang",
              style: semibold.copyWith(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 120,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 10, bottom: 10),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Text("Fattening",
                                          style: semibold.copyWith(
                                            color: Color(0xFF24408E),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 1, top: 15),
                                      child: Text(
                                        "(kandang dara)",
                                        style: semibold.copyWith(
                                          color: Color(0xFF24408E),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 7, left: 15),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Berat",
                                                style: regular.copyWith(
                                                    color: Color(0xFF646464),
                                                    fontSize: 14),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "100",
                                                      style:
                                                          semibold.copyWith(),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text(
                                                      "kg",
                                                      style:
                                                          semibold.copyWith(),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 7, left: 20, right: 20),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                "ID",
                                                style: regular.copyWith(
                                                  color: Color(0xFF646464),
                                                ),
                                              ),
                                              Text(
                                                "999999",
                                                style: semibold,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.delete_forever,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ));
                  }),
            ),
            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffE5E5E5),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text("Total Berat",
                                style: semibold.copyWith(
                                  color: Color(0xFF24408E),
                                )),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "720",
                                  style: semibold.copyWith(
                                    color: Color(0xFF24408E),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text("kg",
                                      style: semibold.copyWith(
                                        color: Color(0xFF24408E),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff24408E)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Invoice()));
                          },
                          child: Text(
                            "Beli",
                            style: semibold,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
