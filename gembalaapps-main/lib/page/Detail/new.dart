// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:mbech/Services/Servchartberat.dart';
// import 'package:http/http.dart' as http;

// class chart extends StatefulWidget {
//   const chart({Key? key}) : super(key: key);

//   @override
//   State<chart> createState() => _chartState();
// }

// class _chartState extends State<chart> {
//   @override
//   Future<chartBerat> Getidberat() async {
//     // final String idternak = id.toString();
//     var hasilGet = await http.get(
//       Uri.parse("https://be.gembala.sembadafarm.com/api/timbangan/list/296"),
//     );

//     if (hasilGet.statusCode == 200) {
//       var data = jsonDecode(hasilGet.body);

//       var dataRes = chartBerat.fromJson(data);

//       debugPrint("Response : $data");
//       return dataRes;
//     }
//     return chartBerat.fromJson(jsonDecode(hasilGet.body));
//   }

//   Widget build(BuildContext context) {
//     return FutureBuilder<chartBerat>(
//         future: Getidberat(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             List<Databerat>? data = snapshot.data?.data;
//             if (data != null) {
//               // DateTime tgl = DateTime.parse(data[0].tanggal.toString());
//               _getSeriesData() {
//                 List<charts.Series<Databerat, int>> series = [
//                   charts.Series<Databerat, int>(
//                       id: "Sales",
//                       data: data,
//                       domainFn: (Databerat series, _) =>
//                           series.suhuBerkala!.toInt(),
//                       measureFn: (Databerat series, _) => series.beratBerkala!,
//                       colorFn: (Databerat series, _) =>
//                           charts.MaterialPalette.blue.shadeDefault)
//                 ];
//                 return series;
//               }

//               // List<charts.Series<Databerat, int>> series = [
//               //   charts.Series(
//               //       id: "Sales",
//               //       data: data,
//               //       domainFn: (Databerat series, _) =>
//               //           series.suhuBerkala!.toInt(),
//               //       measureFn: (Databerat series, _) =>
//               //           series.beratBerkala,
//               //       colorFn: (Databerat series, _) =>
//               //           charts.MaterialPalette.blue.shadeDefault)
//               // ];
//               var chart = charts.LineChart(
//                 _getSeriesData(),
//                 animate: true,
//                 // animationDuration: const Duration(seconds: 3),
//                 // domainAxis: new charts.OrdinalAxisSpec(
//                 //     renderSpec: new charts.SmallTickRendererSpec(
//                 //         // Tick and Label styling here.
//                 //         labelStyle: new charts.TextStyleSpec(
//                 //             fontFamily: 'poppins',
//                 //             fontSize: 12, // size in Pts.
//                 //             color: charts.ColorUtil.fromDartColor(
//                 //                 Color.fromARGB(255, 0, 0, 0))),

//                 //         // Change the line colors to match text color.
//                 //         lineStyle: const charts.LineStyleSpec(
//                 //             color: charts.MaterialPalette.black))),
//               );
//               return Expanded(child: chart);
//             }
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//   }
// }

// class SalesData {
//   final int year;
//   final int sales;

//   SalesData(this.year, this.sales);
// }

// final data = [
//   new SalesData(0, 1500000),
//   new SalesData(1, 1735000),
//   new SalesData(2, 1678000),
//   new SalesData(3, 1890000),
//   new SalesData(4, 1907000),
//   new SalesData(5, 2300000),
//   new SalesData(6, 2360000),
//   new SalesData(7, 1980000),
//   new SalesData(8, 2654000),
//   new SalesData(9, 2789070),
//   new SalesData(10, 3020000),
//   new SalesData(11, 3245900),
//   new SalesData(12, 4098500),
//   new SalesData(13, 4500000),
//   new SalesData(14, 4456500),
//   new SalesData(15, 3900500),
//   new SalesData(16, 5123400),
//   new SalesData(17, 5589000),
//   new SalesData(18, 5940000),
//   new SalesData(19, 6367000),
// ];

// _getSeriesData() {
//   List<charts.Series<SalesData, int>> series = [
//     charts.Series(
//         id: "Sales",
//         data: data,
//         domainFn: (SalesData series, _) => series.year,
//         measureFn: (SalesData series, _) => series.sales,
//         colorFn: (SalesData series, _) =>
//             charts.MaterialPalette.blue.shadeDefault)
//   ];
//   return series;
// }
