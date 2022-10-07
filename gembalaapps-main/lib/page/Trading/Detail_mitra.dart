import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/Services/Servlistfarm.dart';
import 'package:mbech/page/Trading/Keranjang.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detailmitra extends StatefulWidget {
  const Detailmitra({Key? key}) : super(key: key);

  @override
  State<Detailmitra> createState() => _DetailmitraState();
}

class _DetailmitraState extends State<Detailmitra> {
  String? selected = 'Semua';
  late final idmit = ModalRoute.of(context)!.settings.arguments as DataMitra;
  final list = [
    "Semua",
    "Cempe",
    "Fattening",
    "Jantan LS",
    "Induk LS",
    "Pejantan",
    "Induk",
    "Induk Bunting",
    "Induk Laktasi",
    "Afkir"
  ];
  @override
  Future<ListMitra> Getidmitra() async {
    final String idmitra = idmit.idUsers.toString();
    var hasilGet = await http.get(
      Uri.parse("https://be.gembala.sembadafarm.com/api/costumer/$idmitra"),
    );

    if (hasilGet.statusCode == 200) {
      var data = jsonDecode(hasilGet.body);

      var dataRes = ListMitra.fromJson(data);

      debugPrint("Response : $data");
      return dataRes;
    }

    throw Exception("Invalid object");
  }

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
          title: Text("Detail Farm",
              style: semibold.copyWith(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Keranjang(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(children: <Widget>[
          SizedBox(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: Container(
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
              child: FutureBuilder<ListMitra>(
                  future: Getidmitra(), //Getidmitra(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DataMitra>? data = snapshot.data?.data;
                      print(idmit.idUsers);
                      if (data != null) {
                        return Container(
                          padding: EdgeInsets.only(left: 16, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${data[0].namaMitra}",
                                  style: semibold.copyWith(
                                      fontSize: 24, color: Color(0xFF24408E))),
                              Text("${data[0].alamat}",
                                  style: semibold.copyWith(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              Text("${data[0].noHp}",
                                  style: semibold.copyWith(
                                      fontSize: 11, color: Color(0xFF646464))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text("Harga/kg",
                                              style: semibold.copyWith(
                                                  fontSize: 12,
                                                  color: Color(0xFF646464))),
                                        ),
                                        Text("Rp 50.000",
                                            style: semibold.copyWith(
                                                fontSize: 12,
                                                color: Color(0xFF000000))),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text("Populasi",
                                              style: semibold.copyWith(
                                                  fontSize: 12,
                                                  color: Color(0xFF646464))),
                                        ),
                                        Container(
                                          child: Text("${data[0].jumlahTernak}",
                                              style: semibold.copyWith(
                                                  fontSize: 12,
                                                  color: Color(0xFF000000))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    }
                    return Container();
                  }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 180),
            width: 138,
            child: DropdownButtonFormField<String>(
              value: selected,
              items: list.map((fase) {
                return DropdownMenuItem(
                  value: fase,
                  child: Text('$fase'),
                );
              }).toList(),
              onChanged: (val) => setState(() => selected = val),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 120,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Detailternak()),
                              );
                            },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 15),
                                          child: Text("Fattening",
                                              style: semibold.copyWith(
                                                color: Color(0xFF24408E),
                                              )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 1, top: 15),
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
                                            margin: EdgeInsets.only(
                                                top: 7, left: 15),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Berat",
                                                    style: regular.copyWith(
                                                        color:
                                                            Color(0xFF646464),
                                                        fontSize: 14),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Text(
                                                          "${180}",
                                                          style: semibold
                                                              .copyWith(),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "kg",
                                                          style: semibold
                                                              .copyWith(),
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
                                                    "${9999}",
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
                                      Icons.add_shopping_cart,
                                      color: Color(0xFF24408E),
                                    ),
                                  ),
                                ],
                              ),
                            )));
                  }))
        ]));
  }
}
