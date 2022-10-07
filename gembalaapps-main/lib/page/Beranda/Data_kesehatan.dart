import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mbech/Services/ServchartSakit.dart';
import 'package:mbech/Services/ServchartTernak.dart';
import 'package:mbech/Services/Servkesehatan.dart';
import 'package:mbech/Services/Servtotalkondisiternak.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:mbech/page/Detail/~Detail_ternakkesehatan.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Detail/Detail_kesehatan.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Datakesehatan extends StatefulWidget {
  const Datakesehatan({Key? key}) : super(key: key);

  @override
  State<Datakesehatan> createState() => DatakesehatanState();
}

class DatakesehatanState extends State<Datakesehatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEFEFF2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFCC29),
          elevation: 1,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
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
            'Data Kesehatan',
            style: semibold.copyWith(
                fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: Column(
          children: <Widget>[
            FutureBuilder(
              future: Usershared.getVerify(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  var verify =
                      Verif.fromJson(jsonDecode(snapshot.data.toString()));
                  print("Data verify : ${snapshot.data}");
                  return FutureBuilder<chartSakit>(
                      future: getsakit(verify),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<Datasakit>? data = snapshot.data?.data;
                          if (data != null) {
                            List<charts.Series<Datasakit, String>> series = [
                              charts.Series<Datasakit, String>(
                                id: 'Fase',
                                colorFn: (Datasakit data, _) =>
                                    charts.ColorUtil.fromDartColor(
                                        const Color(0xFF24408E)),
                                domainFn: (Datasakit data, _) =>
                                    data.namaPenyakit.toString(),
                                measureFn: (Datasakit data, _) => data.jumlah,
                                labelAccessorFn: ((Datasakit data, _) =>
                                    "${data.jumlah}"),
                                outsideLabelStyleAccessorFn:
                                    (Datasakit data, _) => charts.TextStyleSpec(
                                        color: charts.ColorUtil.fromDartColor(
                                  const Color(0xFF24408E),
                                )),
                                data: data,
                              )
                            ];

                            var chart = charts.BarChart(
                              series,
                              vertical: false,
                              barRendererDecorator:
                                  charts.BarLabelDecorator<String>(),
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              animationDuration: const Duration(seconds: 3),
                              domainAxis: new charts.OrdinalAxisSpec(
                                  renderSpec: new charts.SmallTickRendererSpec(
                                      // Tick and Label styling here.
                                      labelStyle: new charts.TextStyleSpec(
                                          fontFamily: 'poppins',
                                          fontSize: 12, // size in Pts.
                                          color: charts.ColorUtil.fromDartColor(
                                              Color.fromARGB(255, 0, 0, 0))),

                                      // Change the line colors to match text color.
                                      lineStyle: const charts.LineStyleSpec(
                                          color:
                                              charts.MaterialPalette.black))),
                            );

                            return Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Grafik Sakit Ternak",
                                      style: semibold.copyWith(
                                          fontSize: 16,
                                          color: const Color(0xFF24408E)),
                                    )),
                                SizedBox(
                                    height: 250,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16, top: 10),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              color: const Color(0xFF24408E),
                                              width: 1),
                                        ),
                                        child: chart)),
                                FutureBuilder<totalKondisi>(
                                    future: getTotalkondisi(verify),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        List<Datatotal>? data =
                                            snapshot.data?.data;
                                        if (data != null) {
                                          List<String> status =
                                              data[0].statusSehat!.toList();
                                          return Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 10,
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(
                                                  "Sehat : ${data[0].jumlah == null ? 0 : data[0].jumlah}",
                                                  style: semibold.copyWith(
                                                      fontSize: 16,
                                                      color: const Color(
                                                          0xFF24408E)),
                                                ),
                                                Text(
                                                  "Sakit : ${data[1].jumlah == null ? 0 : data[1].jumlah}",
                                                  style: semibold.copyWith(
                                                      fontSize: 16,
                                                      color: const Color(
                                                          0xFF24408E)),
                                                ),
                                                // Container(
                                                //   margin:
                                                //       EdgeInsets.only(top: 20),
                                                //   child: Text(
                                                //     "Sembuh : ${data[2].jumlah == null ? 0 : data[2].jumlah}",
                                                //     style: bold.copyWith(
                                                //         fontSize: 16,
                                                //         color:
                                                //             const Color.fromARGB(
                                                //                 255, 0, 0, 0)),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                      return Center(
                                        child: Text(""),
                                      );
                                    }),
                              ],
                            );
                          }
                          return Center(
                            child: Text(""),
                          );
                        }
                      });
                }
                return Center(
                  child: Text(""),
                );
              },
            ),
            FutureBuilder(
                future: Usershared.getVerify(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    var verify =
                        Verif.fromJson(jsonDecode(snapshot.data.toString()));
                    print("Data verify : ${snapshot.data}");
                    return FutureBuilder<Kesehatan>(
                        future: getKesehatan(verify),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<Data>? data = snapshot.data?.data;
                            if (data != null) {
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Detailternak(),
                                                  settings: RouteSettings(
                                                      arguments: data[index]
                                                          .idTernak
                                                          .toString())),
                                            );
                                          },
                                          child: Container(
                                              // height: 80,
                                              margin: EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffE5E5E5),
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
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20, top: 3),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/image/sheep1.png"))),
                                                          ),
                                                          Text(
                                                              "${data[index].nomor}",
                                                              style: semibold),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                              "${data[index].namaPenyakit}",
                                                              style: semibold
                                                                  .copyWith(
                                                                color: Color(
                                                                    0xFF24408E),
                                                              )),
                                                          Text(
                                                              "Tanggal Sakit : ${data[index].tglSakit}",
                                                              style: semibold.copyWith(
                                                                  color: Color(
                                                                      0xFF24408E),
                                                                  fontSize:
                                                                      12)),
                                                          Text(
                                                              "Tanggal Sembuh : ${data[index].tglSembuh == null ? "-" : data[index].tglSembuh}",
                                                              style: semibold.copyWith(
                                                                  color: Color(
                                                                      0xFF24408E),
                                                                  fontSize:
                                                                      12)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5, left: 5),
                                                        child: Column(
                                                          children: [
                                                            IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Image.asset(
                                                                    "assets/image/edit.png")),
                                                            IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Image.asset(
                                                                    "assets/image/hapus.png")),
                                                          ],
                                                        ))
                                                  ])));
                                    }),
                              );
                            }
                            return Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.9,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 150),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter: new ColorFilter.mode(
                                                  Color(0x00EFEFF2)
                                                      .withOpacity(0.5),
                                                  BlendMode.dstATop),
                                              image: AssetImage(
                                                  "assets/image/sad1.png"))),
                                    ),
                                    Text("Data Ternak kosong",
                                        style: medium.copyWith(
                                            fontSize: 25,
                                            color: Color.fromARGB(255, 0, 0, 0)
                                                .withOpacity(0.5))),
                                  ]),
                            );
                          }
                        });
                  }
                  return Center(
                    child: Text(""),
                  );
                })
          ],
        ));
  }
}
