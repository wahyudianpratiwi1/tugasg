import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/Services/Servkesehatan.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Detailkesehatan extends StatefulWidget {
  const Detailkesehatan({Key? key}) : super(key: key);

  @override
  State<Detailkesehatan> createState() => _DetailkesehatanState();
}

class _DetailkesehatanState extends State<Detailkesehatan> {
  late final id = ModalRoute.of(context)!.settings.arguments as Data;
  @override
  // https://be.gembala.sembadafarm.com/api/kesehatan/list/1
  Future<Ternak> getIdternak() async {
    final String idternak = id.idTernak.toString();
    var hasilGet = await http.get(
      Uri.parse("https://be.gembala.sembadafarm.com/api/ternak/$idternak"),
    );

    if (hasilGet.statusCode == 200) {
      var data = jsonDecode(hasilGet.body);

      var dataRes = Ternak.fromJson(data);

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
            'Detail Kesehatan',
            style: semibold.copyWith(
                fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: FutureBuilder<Ternak>(
            future: getIdternak(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<DataTernak>? data = snapshot.data?.data;
                if (data != null) {
                  debugPrint("Data : ${data[0].idTernak}");
                  return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
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
                                            arguments: data[index])),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 15),
                                        child: Text("${data[index].fase}",
                                            style: semibold.copyWith(
                                              color: Color(0xFF24408E),
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "${data[index].beratBerkala} kg",
                                                      style: semibold,
                                                    ),
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
                                                    "${data[index].idTernak}",
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
                      });
                }
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
