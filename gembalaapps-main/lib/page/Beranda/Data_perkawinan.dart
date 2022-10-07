import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:http/http.dart' as http;
import 'package:mbech/page/Detail/Detail_perkawinan.dart';
import 'dart:convert';
import '../../util/constant.dart';
import 'package:mbech/Services/Servperkawinan.dart';

class Dataperkawinan extends StatefulWidget {
  const Dataperkawinan({Key? key}) : super(key: key);

  @override
  State<Dataperkawinan> createState() => _DataperkawinanState();
}

class _DataperkawinanState extends State<Dataperkawinan> {
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
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Data Perkawinan',
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
                return FutureBuilder<perkawinan>(
                    future: getperkawinan(verify),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                                final Data itemperkawinan = data[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPerkawinan(),
                                          settings: RouteSettings(
                                            arguments: itemperkawinan,
                                          ),
                                        ));
                                    print(itemperkawinan);
                                  },
                                  child: SizedBox(
                                    height: 80,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 16, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xffE5E5E5),
                                            width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            blurStyle: BlurStyle.outer,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 8,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 16),
                                                child: Text(
                                                  "${data[index].idternak}",
                                                  style: semibold.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF24408E),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 30),
                                                child: Text(
                                                    "Tanggal Kawin : ${data[index].tanggalkawin}",
                                                    style: semibold.copyWith(
                                                      fontSize: 16,
                                                      color: Color(0xFF24408E),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.9,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: new ColorFilter.mode(
                                            Color(0x00EFEFF2).withOpacity(0.5),
                                            BlendMode.dstATop),
                                        image: AssetImage(
                                            "assets/image/sad1.png"))),
                              ),
                              Text("Data Perkawinan Kosong",
                                  style: medium.copyWith(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.5))),
                            ],
                          ),
                        );
                      }
                    });
              } else {
                Text("Data Perkawinan Kosong");
              }
              return Container();
            },
          )),
    );
  }
}
