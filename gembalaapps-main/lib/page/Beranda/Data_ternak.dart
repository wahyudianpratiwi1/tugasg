import 'package:flutter/material.dart';
import 'package:mbech/Services/ServchartTernak.dart';
import 'package:mbech/Services/ServchartTernak.dart';
import 'package:mbech/Services/Servlogin.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mbech/page/Trading/Keranjang.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/page/Homepage/Beranda.dart';
import 'package:mbech/data/usershared.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mbech/Services/Servverify.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dataternak extends StatefulWidget {
  const Dataternak({
    Key? key,
  }) : super(key: key);

  @override
  State<Dataternak> createState() => _DataternakState();
}

class _DataternakState extends State<Dataternak> {
  String? selected = 'Semua';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFCC29),
        elevation: 1,
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
          'Data Ternak',
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
                return FutureBuilder<Ternak>(
                    future: ambilData(verify),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<DataTernak>? data = snapshot.data?.data;
                        if (data != null) {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Total Populasi :",
                                        style: semibold.copyWith(
                                            fontSize: 18,
                                            color: const Color(0xFF383874))),
                                    Text(
                                      " ${data.length}",
                                      style: semibold.copyWith(
                                          fontSize: 18,
                                          color: const Color(0xFF383874)),
                                    ),
                                    Text("  Domba",
                                        style: medium.copyWith(
                                            fontSize: 18,
                                            color: const Color(0xFF383874))),
                                  ],
                                ),
                              ),

                              FutureBuilder(
                                  future: Usershared.getVerify(),
                                  builder: (BuildContext ctx,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.data != null) {
                                      var verify = Verif.fromJson(
                                          jsonDecode(snapshot.data.toString()));
                                      print("Data verify : ${snapshot.data}");
                                      return FutureBuilder<Chart>(
                                          future: getfase(verify),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else {
                                              List<Datachart>? data =
                                                  snapshot.data?.data;
                                              if (data != null) {
                                                List<
                                                    charts.Series<Datachart,
                                                        String>> series = [
                                                  charts.Series<Datachart,
                                                      String>(
                                                    id: 'Fase',
                                                    colorFn: (Datachart data,
                                                            _) =>
                                                        charts.ColorUtil
                                                            .fromDartColor(
                                                                const Color(
                                                                    0xFF24408E)),
                                                    domainFn: (Datachart data,
                                                            _) =>
                                                        data.fase.toString(),
                                                    measureFn:
                                                        (Datachart data, _) =>
                                                            data.jumlahTernak,
                                                    labelAccessorFn: ((Datachart
                                                                data,
                                                            _) =>
                                                        "${data.jumlahTernak}"),
                                                    outsideLabelStyleAccessorFn:
                                                        (Datachart data, _) => charts
                                                            .TextStyleSpec(
                                                                color: charts
                                                                        .ColorUtil
                                                                    .fromDartColor(
                                                      const Color(0xFF24408E),
                                                    )),
                                                    data: data,
                                                  )
                                                ];

                                                var chart = charts.BarChart(
                                                  series,
                                                  vertical: false,
                                                  barRendererDecorator:
                                                      charts.BarLabelDecorator<
                                                          String>(),
                                                  animate: true,
                                                  barGroupingType: charts
                                                      .BarGroupingType.grouped,
                                                  animationDuration:
                                                      const Duration(
                                                          seconds: 3),
                                                  domainAxis: new charts
                                                          .OrdinalAxisSpec(
                                                      renderSpec: new charts
                                                              .SmallTickRendererSpec(
                                                          labelStyle: new charts
                                                                  .TextStyleSpec(
                                                              fontFamily:
                                                                  "poppins",
                                                              color: charts
                                                                  .MaterialPalette
                                                                  .black),
                                                          lineStyle: new charts
                                                              .LineStyleSpec(
                                                            color: charts
                                                                .MaterialPalette
                                                                .black,
                                                          ))),
                                                );
                                                return SizedBox(
                                                    height: 250,
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 16,
                                                            right: 16,
                                                            top: 10,
                                                            bottom: 10),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFF24408E),
                                                              width: 1),
                                                        ),
                                                        child: chart));
                                              }
                                            }
                                            return const Center(
                                                child:
                                                    Text("Data Ternak kosong"));
                                          });
                                    }
                                    return const Center(
                                        child: Text("Data Ternak kosong"));
                                  }),

                              // Container(
                              //   margin: const EdgeInsets.only(left: 180),
                              //   width: 138,
                              //   child: DropdownButtonFormField<String>(
                              //     value: selected,
                              //     items: list.map((fase) {
                              //       return DropdownMenuItem(
                              //         value: fase,
                              //         child: Text('$fase'),
                              //       );
                              //     }).toList(),
                              //     onChanged: (val) =>
                              //         setState(() => selected = val),
                              //   ),
                              // ),
                              Expanded(
                                  child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Center(
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
                                            ),
                                          ),
                                        );
                                      },

                                      // width: MediaQuery.of(context).size.width / 0.5,
                                      // margin: const EdgeInsets.only(left: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15, top: 15),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "ID   ",
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
                                                    ]),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15, top: 15),
                                                        child: Text(
                                                            "${data[index].fase}",
                                                            style: semibold
                                                                .copyWith(
                                                              color: Color(
                                                                  0xFF24408E),
                                                            )),
                                                      ),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 0,
                                                                  left: 20,
                                                                  right: 20,
                                                                  bottom: 10),
                                                          child: Center(
                                                              child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Image
                                                                        .asset(
                                                                            "assets/image/edit.png")),
                                                              ])))
                                                      // Container(
                                                      //   margin: EdgeInsets.only(
                                                      //       left: 1, top: 15),
                                                      //   child: Text(
                                                      //     "(kandang dara)",
                                                      //     style: semibold.copyWith(
                                                      //       color: Color(0xFF24408E),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ]),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 0,
                                                          left: 15,
                                                          bottom: 10),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Berat",
                                                              style: regular.copyWith(
                                                                  color: Color(
                                                                      0xFF646464),
                                                                  fontSize: 14),
                                                            ),
                                                            Text(
                                                              "${data[index].beratBerkala} Kg",
                                                              style: semibold
                                                                  .copyWith(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 0,
                                                          left: 20,
                                                          right: 20,
                                                          bottom: 10),
                                                      child: Center(
                                                        child: Column(
                                                          children: <Widget>[
                                                            // IconButton(
                                                            //     onPressed:
                                                            //         () {},
                                                            //     icon: Image.asset(
                                                            //         "assets/image/edit.png")),
                                                            IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Image.asset(
                                                                    "assets/image/hapus.png"))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                            ],
                          );
                        } else {
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
                                              Color(0x00EFEFF2)
                                                  .withOpacity(0.5),
                                              BlendMode.dstATop),
                                          image: AssetImage(
                                              "assets/image/sad1.png"))),
                                ),
                                Text("Data Ternak kosong",
                                    style: semibold.copyWith(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(0.5))),
                              ]));
                        }
                      }
                    });
              }
              return const Center(child: Text("Data Ternak kosong"));
            }),
      ),
    );
  }
}
