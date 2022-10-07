import 'package:flutter/material.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/Trading/List_mitra.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_ditolak.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_Konfirmasi.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_proses.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_selesai.dart';
import 'package:mbech/page/Trading/Pembelian/Detail_pembayaran.dart';
import 'package:mbech/page/Trading/Penjualan/Detail_proses.dart';
import 'package:mbech/page/Trading/Penjualan/Detail_ditolak.dart';
import 'package:mbech/page/Trading/Penjualan/Detail_pembayaran.dart';
import 'package:mbech/page/Trading/Penjualan/Detail_konfirmasi.dart';
import 'package:mbech/page/Trading/Penjualan/Detail_selesai.dart';
import 'package:mbech/page/Trading/Trxpembelian.dart';
import 'package:mbech/page/Trading/Trxpenjualan.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/data/Trading.dart';

class Trading extends StatefulWidget {
  const Trading({Key? key}) : super(key: key);

  @override
  State<Trading> createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  var Title = Text("Transaksi Saya",
      style: semibold.copyWith(
          fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)));

  @override
  void initState() {
    // items.addAll(duplicateItems);
    super.initState();
  }

  // void filterSearchResults(String query) {
  //   List<String> dummySearchList = [];
  //   dummySearchList.addAll(duplicateItems);
  //   if (query.isNotEmpty) {
  //     List<String> dummyListData = [];
  //     dummySearchList.forEach((item) {
  //       if (item.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     });
  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(duplicateItems);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/sad1.png"))),
          ),
          Text("Coming Soon",
              style: semibold.copyWith(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7))),
        ])));
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         automaticallyImplyLeading: false,
    //         centerTitle: true,
    //         backgroundColor: Colors.amber,
    //         title: Text("Transaksi Saya",
    //             style: semibold.copyWith(
    //                 fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
    //         bottom: TabBar(tabs: <Widget>[
    //           Tab(
    //             text: "Pembelian",
    //           ),
    //           Tab(
    //             text: "Penjualan",
    //           ),
    //         ]),
    //       ),

    // TabBarView(children: <Widget>[
    //   Trxpembelian(),
    //   Trxpenjualan(),
    // ]),
    // Column(
    //   children: <Widget>[
    // Stack(children: <Widget>[
    // Container(
    //   margin: const EdgeInsets.only(bottom: 20),
    //   width: MediaQuery.of(context).size.width / 1,
    //   height: MediaQuery.of(context).size.height / 5,
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //           fit: BoxFit.fill,
    //           image: AssetImage("assets/image/dash11.png"))),
    // ),
    // Column(
    //   children: <Widget>[
    //     Container(
    //       margin: const EdgeInsets.only(top: 30),
    //       child: Center(
    //           child: Text("Transaksi Saya",
    //               style: semibold.copyWith(fontSize: 20))),
    //     ),
    //   ],
    // ),
    // Container(
    //   margin: EdgeInsets.only(top: 78),
    //   height: 50,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: <Widget>[
    //       TextButton(
    //           onPressed: (() {
    //             pageController.animateToPage(0,
    //                 duration: Duration(milliseconds: 250),
    //                 curve: Curves.ease);
    //           }),
    //           style: TextButton.styleFrom(
    //             primary: PageChanged == 0
    //                 ? Color(0xFF000000)
    //                 : Color(0xFF646464),
    //           ),
    //           child: Column(
    //             children: <Widget>[
    //               Text(
    //                 'Pembelian',
    //                 style: semibold.copyWith(
    //                   fontSize: 16,
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 2),
    //                 width: 80,
    //                 height: 4,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: PageChanged == 0
    //                       ? Color(0xFF000000)
    //                       : Colors.transparent,
    //                 ),
    //               )
    //             ],
    //           )),
    //       TextButton(
    //           onPressed: (() {
    //             pageController.animateToPage(1,
    //                 duration: Duration(milliseconds: 250),
    //                 curve: Curves.ease);
    //           }),
    //           style: TextButton.styleFrom(
    //             primary: PageChanged == 0
    //                 ? Color(0xFF646464)
    //                 : Color(0xFF000000),
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10)),
    //           ),
    //           child: Column(
    //             children: <Widget>[
    //               Text(
    //                 'Penjualan',
    //                 style: semibold.copyWith(
    //                   fontSize: 16,
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 2),
    //                 width: 80,
    //                 height: 4,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: PageChanged == 0
    //                       ? Colors.transparent
    //                       : Color(0xFF000000),
    //                 ),
    //               )
    //             ],
    //           )),
    //     ],
    //   ),
    // ),
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       Container(
    //         margin: const EdgeInsets.only(top: 150, right: 16),
    //         width: 120,
    //         height: 22,
    //         child: Center(
    //           child: TextField(
    //             onChanged: (value) {
    //               filterSearchResults(value);
    //             },
    //             textAlign: TextAlign.start,
    //             controller: editingController,
    //             decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.only(top: 5),
    //                 hintText: "Select Date",
    //                 hintStyle: regular.copyWith(
    //                     color: const Color(0xFF8193AD), fontSize: 12),
    //                 prefixIcon: const Icon(
    //                   Icons.calendar_today,
    //                   size: 18,
    //                 ),
    //                 filled: true,
    //                 fillColor: const Color.fromARGB(255, 255, 255, 255),
    //                 border: const OutlineInputBorder()),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ]),
    // Expanded(
    //   child: PageView(
    //     controller: pageController,
    //     onPageChanged: (index) {
    //       setState(() {
    //         PageChanged = index;
    //       });
    //     },
    //     children: <Widget>[
    //       Container(
    //           color: const Color(0xFFFFFFFF),
    //           child: ),
    //       Container(
    //           color: const Color(0xFFFFFFFF),
    //           child: )
    //     ],
    //   ),
    // ),
    //   ],
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Listmitra()));
    //   },
    //   tooltip: 'Go to Mitra',
    //   child: Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
    // ),
  }
}
