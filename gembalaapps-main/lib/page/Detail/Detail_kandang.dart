import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdetailkandang.dart';
import 'package:mbech/Services/Servkandang.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Detail/~Detail_ternakkandang.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:mbech/page/beranda/Filter_ternak.dart';

class Detailkandang extends StatefulWidget {
  const Detailkandang({Key? key}) : super(key: key);

  @override
  State<Detailkandang> createState() => _DetailkandangState();
}

class _DetailkandangState extends State<Detailkandang> {
  late final id = ModalRoute.of(context)!.settings.arguments as Data;
  @override
  Future<detailKandang> getIdkandang() async {
    print("idkandang : ${id.id_kandang}");
    final String idkandang = id.id_kandang.toString();
    var hasilGet = await http.get(
      Uri.parse(
          "https://be.gembala.sembadafarm.com/api/ternak/listbykandang/$idkandang"),
    );
    print(hasilGet.statusCode);
    if (hasilGet.statusCode == 200) {
      var data = jsonDecode(hasilGet.body);
      var dataRes = detailKandang.fromJson(data);
      debugPrint("Response : $data");
      return dataRes;
    }

    throw Exception("Invalid object");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEFEFF2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFCC29),
          elevation: 1,
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
            'Detail Kandang',
            style: semibold.copyWith(
                fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: FutureBuilder<detailKandang>(
            future: getIdkandang(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Datadetail>? data = snapshot.data?.data;
                if (data != null) {
                  String fase = snapshot.data!.data![0].fase.toString();
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 18, top: 14, bottom: 10),
                        margin: EdgeInsets.all(5),
                        // height: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFEFEFF2),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset.zero,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${data[0].namaKandang}",
                              style: semibold.copyWith(
                                  fontSize: 24, color: Color(0xFF24408E)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Populasi",
                                        style: semibold.copyWith(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      Text("${data.length} ekor",
                                          style: medium.copyWith(
                                              fontSize: 14,
                                              color: Color(0xFF121212))),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Berat total",
                                          style: medium.copyWith(
                                              fontSize: 15,
                                              color: Color(0xFF646464))),
                                      Text("${id.total_berat}",
                                          style: semibold.copyWith(
                                              fontSize: 14,
                                              color: Color(0xFF121212))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    height: 120,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Detailternak(),
                                                settings: RouteSettings(
                                                  arguments: data[index]
                                                      .idTernak
                                                      .toString(),
                                                )),
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
                                              color: const Color(0xffE5E5E5),
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 15),
                                                child: Text(
                                                    "${data[index].fase}",
                                                    style: semibold.copyWith(
                                                      color: Color(0xFF24408E),
                                                    )),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                                color: Color(
                                                                    0xFF646464),
                                                                fontSize: 14),
                                                          ),
                                                          Row(
                                                            children: <Widget>[
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  "${data[index].beratBerkala} kg",
                                                                  style: semibold
                                                                      .copyWith(),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 7,
                                                        left: 20,
                                                        right: 20),
                                                    child: Center(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "ID",
                                                            style: regular
                                                                .copyWith(
                                                              color: Color(
                                                                  0xFF646464),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${data[index].nomor}",
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
                                        )));
                              })),
                    ],
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
