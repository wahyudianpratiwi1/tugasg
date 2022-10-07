import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/Services/Servdetailkesehatan.dart';
import 'package:mbech/page/Detail/Detail_kesehatan.dart';
import 'package:mbech/page/Detail/~Detail_ternakkesehatan.dart';
import 'package:mbech/util/constant.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Riwayatsakit extends StatefulWidget {
  const Riwayatsakit({Key? key}) : super(key: key);

  @override
  State<Riwayatsakit> createState() => RriwayatStatesakit();
}

class RriwayatStatesakit extends State<Riwayatsakit> {
  late final id = ModalRoute.of(context)!.settings.arguments as String;

  @override
  Future<detailSakit> Getidternakkes() async {
    final String idternak = id.toString();
    var hasilGet = await http.get(
      Uri.parse(
          "https://be.gembala.sembadafarm.com/api/kesehatan/listkesehatan/$idternak"),
    );
    if (hasilGet.statusCode == 200) {
      var data = jsonDecode(hasilGet.body);

      var dataRes = detailSakit.fromJson(data);

      debugPrint("Response : $data");
      return dataRes;
    } else {
      Center(
        child: Text("Data Tidak Ada"),
      );
    }
    return detailSakit.fromJson(jsonDecode(hasilGet.body));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFF24408E),
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
          'Riwayat Sakit',
          style: semibold.copyWith(
              fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: FutureBuilder<detailSakit>(
          future: Getidternakkes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Data>? data = snapshot.data?.data;
              if (data != null) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                          // height: 80,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 40,
                                        width: 40,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/image/sheep1.png"))),
                                      ),
                                      Text("${data[index].nomor}",
                                          style: semibold),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("${data[index].namaPenyakit}",
                                          style: semibold.copyWith(
                                            color: Color(0xFF24408E),
                                          )),
                                      Text(
                                          "Tanggal Sakit : ${data[index].tglSakit}",
                                          style: semibold.copyWith(
                                              color: Color(0xFF24408E),
                                              fontSize: 12)),
                                      Text(
                                          "Tanggal Sembuh : ${data[index].tglSembuh == null ? "-" : data[index].tglSembuh}",
                                          style: semibold.copyWith(
                                              color: Color(0xFF24408E),
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ]));
                    });
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/404.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Data tidak ditemukan',
                          style: medium.copyWith(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5))),
                    ],
                  ),
                );
              }
              // return Center(
              //   child: CircularProgressIndicator(),
              // );
            }
          }),
    );
  }
}
