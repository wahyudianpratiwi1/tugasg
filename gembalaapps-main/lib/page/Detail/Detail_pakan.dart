import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servpakan.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';

import '../../util/constant.dart';

class detailPakan extends StatefulWidget {
  const detailPakan({Key? key}) : super(key: key);

  @override
  State<detailPakan> createState() => _detailPakanState();
}

class _detailPakanState extends State<detailPakan> {
  late final idPakan = ModalRoute.of(context)!.settings.arguments as Data;
  @override
  // Future<pakan> getidpakan() async {
  //   String id = idPakan.idPakan.toString();
  //   var hasilGet = await http.get(
  //     Uri.parse("https://be.gembala.sembadafarm.com/api/pakan/$id"),
  //   );

  //   if (hasilGet.statusCode == 200) {
  //     var data = jsonDecode(hasilGet.body);

  //     var dataRes = pakan.fromJson(data);

  //     debugPrint("Response : $data");
  //     return dataRes;
  //   }

  //   throw Exception("Invalid object");
  // }

  Widget build(BuildContext context) {
    return Scaffold(
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
          'Detail Pakan',
          style: semibold.copyWith(
              fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Center(
        child: FutureBuilder(
            future: Usershared.getVerify(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                var verify =
                    Verif.fromJson(jsonDecode(snapshot.data.toString()));
                print("Data verify : ${snapshot.data}");
                return FutureBuilder<pakan>(
                    future: getpakan(verify),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Data>? data = snapshot.data?.data;
                        if (data != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1,
                                margin: EdgeInsets.only(
                                    top: 25, left: 16, right: 16, bottom: 10),
                                // height: 150,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Nama Pakan :",
                                        style: bold.copyWith(
                                            fontSize: 16,
                                            color: Color(0xFF24408E)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(" ${idPakan.namaPakan}",
                                            style: semibold.copyWith(
                                                fontSize: 14)),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Deskripsi :",
                                        style: bold.copyWith(
                                            fontSize: 16,
                                            color: Color(0xFF24408E)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(" ${idPakan.deskripsi}",
                                            style: semibold.copyWith(
                                                fontSize: 14)),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Komposisi :",
                                        style: bold.copyWith(
                                            fontSize: 16,
                                            color: Color(0xFF24408E)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(" ${idPakan.komposisi}",
                                            style: semibold.copyWith(
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                      return Container();
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
