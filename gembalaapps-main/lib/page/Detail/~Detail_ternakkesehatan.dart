import 'package:flutter/material.dart';
import 'package:mbech/page/Detail/Riwayat_sakit.dart';
import 'package:mbech/util/constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detailternakkes extends StatefulWidget {
  const Detailternakkes({Key? key}) : super(key: key);

  @override
  State<Detailternakkes> createState() => _DetailternakkesState();
}

class _DetailternakkesState extends State<Detailternakkes> {
  PageController pageController = PageController(initialPage: 0);
  int PageChanged = 0;
  bool pressed = true;
  late final id = ModalRoute.of(context)!.settings.arguments as String;

  @override
  void initstate() {
    debugPrint(id.toString());
    TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Future<Ternak> Getidternak() async {
    final String idternak = id.toString();
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
          'Detail Ternak',
          style: semibold.copyWith(
              fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 10),
              // height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 1),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder<Ternak>(
                      future: Getidternak(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<DataTernak>? data = snapshot.data?.data;
                          if (data != null) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 20),
                                      child: Text("${data[0].fase}",
                                          style: semibold.copyWith(
                                            fontSize: 20,
                                            color: Color(0xFF24408E),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Text("${data[0].namaKandang}",
                                          style: semibold.copyWith(
                                              fontSize: 16,
                                              color: Color(0xFF646464))),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, right: 20, bottom: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/image/sheep1.png"))),
                                          ),
                                          Text("${data[0].nomor}",
                                              style: semibold),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                        }
                        return Container();
                      })
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            // height: 65,
            decoration: BoxDecoration(
                color: Color(0xff24408E),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6),
                  width: 100,
                  // height: 65,
                  child: TextButton(
                      onPressed: (() {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease);
                      }),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: PageChanged == 0
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Colors.transparent,
                          primary: PageChanged == 0
                              ? Color(0xFF24408E)
                              : Color.fromARGB(255, 255, 255, 255)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Informasi',
                            style: semibold.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Umum',
                            style: semibold.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  width: 100,
                  // height: 65,
                  child: TextButton(
                      onPressed: (() {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease);
                      }),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: PageChanged == 1
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Colors.transparent,
                          primary: PageChanged == 1
                              ? Color(0xFF24408E)
                              : Color.fromARGB(255, 255, 255, 255)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Detail',
                            style: semibold.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Kondisi',
                            style: semibold.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  width: 100,
                  // height: 65,
                  child: TextButton(
                      onPressed: (() {
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease);
                      }),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: PageChanged == 2
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Colors.transparent,
                          primary: PageChanged == 2
                              ? Color(0xFF24408E)
                              : Color.fromARGB(255, 255, 255, 255)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Grafik',
                            style: semibold.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  PageChanged = index;
                });
              },
              children: <Widget>[
                FutureBuilder<Ternak>(
                    future: Getidternak(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<DataTernak>? data = snapshot.data?.data;
                        if (data != null) {
                          return Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Color(0xffE4E9F9),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Kelamin",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Varietas",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Tanggal Lahir",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Tanggal Masuk",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Usia",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Id Pejantan",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("Id Induk",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(":",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                            "${data[0].jenisKelamin == [
                                                  "0"
                                                ] ? "Jantan" : "Betina"}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].namaVarietas}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].tanggalLahir}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].tanggalMasuk}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].umur}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].idPejantan}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text("${data[0].idInduk}",
                                            style: medium.copyWith(
                                                fontSize: 16,
                                                color: Color(0xFF244C8E))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      }
                      return Container();
                    }),
                FutureBuilder<Ternak>(
                    future: Getidternak(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<DataTernak>? data = snapshot.data?.data;
                        if (data != null) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Color(0xffE4E9F9),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text("Kondisi Domba",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text("Berat",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text("Pakan",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(":",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(":",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(":",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Column(
                                              children: [
                                                if (data[0].statusSehat ==
                                                    [0]) ...[
                                                  Text(
                                                    "Sehat",
                                                    style: medium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF244C8E)),
                                                  )
                                                ] else if (data[0]
                                                        .statusSehat ==
                                                    [1]) ...[
                                                  Text(
                                                    "Sakit",
                                                    style: medium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF244C8E)),
                                                  )
                                                ] else ...[
                                                  Text(
                                                    "Sembuh",
                                                    style: medium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF244C8E)),
                                                  )
                                                ]

                                                // Text(
                                                //     "${data[0].statusSehat}",
                                                //     style: medium.copyWith(
                                                //         fontSize: 16,
                                                //         color: Color(0xFF244C8E))),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                                "${data[0].beratBerkala}",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text("${data[0].namaPakan}",
                                                style: medium.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF244C8E))),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff24408E),
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Riwayatsakit(),
                                            settings: RouteSettings(
                                                arguments: data[0]
                                                    .idTernak
                                                    .toString())));
                                  },
                                  child: Text("Lihat Riwayat Sakit"))
                            ],
                          );
                        }
                      }
                      return Container();
                    }),
                // SafeArea(
                //   child: Scaffold(
                //     body: SfCartesianChart(
                //       tooltipBehavior: TooltipBehavior(enable: true),
                //       title: ChartTitle(text: 'Timbangan Berkala'),
                //       legend: Legend(isVisible: true),
                //       series: <ChartSeries>[
                //         LineSeries<SalesData, double>(
                //           name: 'Ternak',
                //           dataSource: getChartData(),
                //           xValueMapper: (SalesData sales, _) => sales.year,
                //           yValueMapper: (SalesData sales, _) => sales.data,
                //           dataLabelSettings: DataLabelSettings(isVisible: true),
                //           enableTooltip: true,
                //         ),
                //       ],
                //       primaryXAxis: NumericAxis(
                //           edgeLabelPlacement: EdgeLabelPlacement.shift),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
