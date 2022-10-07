// -----------------------------------------------------------------------------
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Detail/Detail_ternak.dart';
import 'package:mbech/util/constant.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class Jelajah extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  DataTernak? ternak;
  static List<DataTernak> data = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Usershared.getVerify(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            var verify = Verif.fromJson(jsonDecode(snapshot.data.toString()));
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
                      return Scaffold(
                        body: Column(
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width / 1,
                                height: MediaQuery.of(context).size.height / 6,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/image/dash11.png"))),
                              ),
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/image/GEMBALA1.png"))),
                                ),
                              ),
                              //   // Row(
                              //   //   children: <Widget>[
                              //   //     Container(
                              //   //       margin:
                              //   //           const EdgeInsets.only(top: 99, left: 7),
                              //   //       width: 300,
                              //   //       height: 70,
                              //   //       child: Center(
                              //   //         child: TextField(
                              //   //           textAlign: TextAlign.start,
                              //   //           controller: _searchController,
                              //   //           decoration: InputDecoration(
                              //   //               contentPadding:
                              //   //                   const EdgeInsets.only(top: 5),
                              //   //               hintText: "Search ID for a lamb",
                              //   //               hintStyle: regular.copyWith(
                              //   //                   color: const Color(0xFF8193AD)),
                              //   //               prefixIcon:
                              //   //                   const Icon(Icons.search),
                              //   //               filled: true,
                              //   //               fillColor: const Color.fromARGB(
                              //   //                   255, 255, 255, 255),
                              //   //               border: const OutlineInputBorder(
                              //   //                   borderRadius: BorderRadius.all(
                              //   //                       Radius.circular(15.0)))),
                              //   //         ),
                              //   //       ),
                              //   //     ),
                              //   //     Container(
                              //   //       margin: const EdgeInsets.only(
                              //   //           top: 99, left: 10),
                              //   //       decoration: const BoxDecoration(
                              //   //           borderRadius: BorderRadius.all(
                              //   //               Radius.circular(15.0))),
                              //   //       child: ElevatedButton(
                              //   //           onPressed: (() => showSearch(
                              //   //                 context: context,
                              //   //                 delegate: SearchPage<DataTernak>(
                              //   //                   onQueryUpdate: (s) => print(s),
                              //   //                   items: data,
                              //   //                   searchLabel: 'Search people',
                              //   //                   suggestion: Center(
                              //   //                     child: Text(
                              //   //                         'Filter people by name, surname or age'),
                              //   //                   ),
                              //   //                   failure: Center(
                              //   //                     child: Text('Error'),
                              //   //                   ),
                              //   //                   filter: (domba) => [
                              //   //                     "${domba.idTernak}",
                              //   //                   ],
                              //   //                   builder: (domba) => Column(
                              //   //                     crossAxisAlignment:
                              //   //                         CrossAxisAlignment.start,
                              //   //                     children: <Widget>[
                              //   //                       Row(
                              //   //                         mainAxisAlignment:
                              //   //                             MainAxisAlignment
                              //   //                                 .center,
                              //   //                         children: [
                              //   //                           Container(
                              //   //                             width: MediaQuery.of(
                              //   //                                         context)
                              //   //                                     .size
                              //   //                                     .width /
                              //   //                                 1.2,
                              //   //                             margin:
                              //   //                                 EdgeInsets.only(
                              //   //                                     left: 16,
                              //   //                                     right: 16,
                              //   //                                     top: 10,
                              //   //                                     bottom: 10),
                              //   //                             decoration:
                              //   //                                 BoxDecoration(
                              //   //                               borderRadius:
                              //   //                                   BorderRadius
                              //   //                                       .circular(
                              //   //                                           10),
                              //   //                               border: Border.all(
                              //   //                                 color: const Color(
                              //   //                                     0xffE5E5E5),
                              //   //                                 width: 1,
                              //   //                               ),
                              //   //                               boxShadow: [
                              //   //                                 BoxShadow(
                              //   //                                   blurStyle:
                              //   //                                       BlurStyle
                              //   //                                           .outer,
                              //   //                                   color: Colors
                              //   //                                       .black
                              //   //                                       .withOpacity(
                              //   //                                           0.1),
                              //   //                                   spreadRadius: 0,
                              //   //                                   blurRadius: 8,
                              //   //                                   offset: const Offset(
                              //   //                                       0,
                              //   //                                       0), // changes position of shadow
                              //   //                                 ),
                              //   //                               ],
                              //   //                             ),
                              //   //                             child: Column(
                              //   //                               crossAxisAlignment:
                              //   //                                   CrossAxisAlignment
                              //   //                                       .start,
                              //   //                               children: <Widget>[
                              //   //                                 Row(
                              //   //                                     mainAxisAlignment:
                              //   //                                         MainAxisAlignment
                              //   //                                             .start,
                              //   //                                     children: <
                              //   //                                         Widget>[
                              //   //                                       Container(
                              //   //                                         margin: EdgeInsets.only(
                              //   //                                             left:
                              //   //                                                 15,
                              //   //                                             top:
                              //   //                                                 15),
                              //   //                                         child: Text(
                              //   //                                             "${domba.fasePemeliharaan}",
                              //   //                                             style:
                              //   //                                                 semibold.copyWith(
                              //   //                                               color:
                              //   //                                                   Color(0xFF24408E),
                              //   //                                             )),
                              //   //                                       ),
                              //   //                                       // Container(
                              //   //                                       //   margin: EdgeInsets.only(
                              //   //                                       //       left: 1, top: 15),
                              //   //                                       //   child: Text(
                              //   //                                       //     "(kandang dara)",
                              //   //                                       //     style: semibold.copyWith(
                              //   //                                       //       color: Color(0xFF24408E),
                              //   //                                       //     ),
                              //   //                                       //   ),
                              //   //                                       // ),
                              //   //                                     ]),
                              //   //                                 Row(
                              //   //                                   mainAxisAlignment:
                              //   //                                       MainAxisAlignment
                              //   //                                           .spaceBetween,
                              //   //                                   children: <
                              //   //                                       Widget>[
                              //   //                                     Container(
                              //   //                                       margin: EdgeInsets.only(
                              //   //                                           top: 7,
                              //   //                                           left:
                              //   //                                               25,
                              //   //                                           bottom:
                              //   //                                               10),
                              //   //                                       child:
                              //   //                                           Center(
                              //   //                                         child:
                              //   //                                             Column(
                              //   //                                           children: [
                              //   //                                             Text(
                              //   //                                               "Berat",
                              //   //                                               style:
                              //   //                                                   regular.copyWith(color: Color(0xFF646464), fontSize: 14),
                              //   //                                             ),
                              //   //                                             Text(
                              //   //                                               "${domba.beratBerkala} Kg",
                              //   //                                               style:
                              //   //                                                   semibold.copyWith(),
                              //   //                                             ),
                              //   //                                           ],
                              //   //                                         ),
                              //   //                                       ),
                              //   //                                     ),
                              //   //                                     Container(
                              //   //                                       margin: EdgeInsets.only(
                              //   //                                           top: 7,
                              //   //                                           left:
                              //   //                                               20,
                              //   //                                           right:
                              //   //                                               20,
                              //   //                                           bottom:
                              //   //                                               10),
                              //   //                                       child:
                              //   //                                           Center(
                              //   //                                         child:
                              //   //                                             Column(
                              //   //                                           children: <
                              //   //                                               Widget>[
                              //   //                                             Text(
                              //   //                                               "ID",
                              //   //                                               style:
                              //   //                                                   regular.copyWith(
                              //   //                                                 color: Color(0xFF646464),
                              //   //                                               ),
                              //   //                                             ),
                              //   //                                             Text(
                              //   //                                               "${domba.idTernak}",
                              //   //                                               style:
                              //   //                                                   semibold,
                              //   //                                             )
                              //   //                                           ],
                              //   //                                         ),
                              //   //                                       ),
                              //   //                                     ),
                              //   //                                   ],
                              //   //                                 ),
                              //   //                               ],
                              //   //                             ),
                              //   //                           ),
                              //   //                         ],
                              //   //                       ),
                              //   //                     ],
                              //   //                   ),
                              //   //                 ),
                              //   //               )),
                              //   //           child: Icon(Icons.search)),
                              //   //     )
                              //   //   ],
                              //   // ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      top: 150, left: 3, right: 3, bottom: 20),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(5),
                                  //   border: Border.all(
                                  //     color: const Color(0xffE5E5E5),
                                  //     width: 1,
                                  //   ),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       blurStyle: BlurStyle.outer,
                                  //       color: Colors.black.withOpacity(0.1),
                                  //       spreadRadius: 0,
                                  //       blurRadius: 8,
                                  //       offset: const Offset(
                                  //           0, 0), // changes position of shadow
                                  //     ),
                                  //   ],
                                  // ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Panduan :",
                                        style: semibold.copyWith(
                                          fontSize: 14,
                                          color: const Color(0xFF24408E),
                                        ),
                                      ),
                                      Text(
                                        "1. Klik tombol 'Search' untuk mencari data ternak",
                                        style: semibold.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "2. Berdasarkan Id ternak, Misal: 1,2,3,4,5.",
                                        style: semibold.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "3. Berdasarkan Status Ternak, Misal: cempe, Induk.",
                                        style: semibold.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "3. Berdasarkan Berat, Misal: 50.0, 100.0, 150.0",
                                        style: semibold.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )),
                            ]),
                            // Center(
                            //   child: Column(children: <Widget>[
                            //     Container(
                            //       width: MediaQuery.of(context).size.width / 2,
                            //       height:
                            //           MediaQuery.of(context).size.height / 2,
                            //       decoration: BoxDecoration(
                            //           image: DecorationImage(
                            //               colorFilter: ColorFilter.mode(
                            //                   Colors.black.withOpacity(0.5),
                            //                   BlendMode.dstATop),
                            //               image: AssetImage(
                            //                   "assets/image/forgot.png"))),
                            //     ),
                            //     Container(
                            //       child: Text("Cari Domba Anda",
                            //           style: medium.copyWith(
                            //               fontSize: 20,
                            //               color: Color.fromARGB(255, 0, 0, 0)
                            //                   .withOpacity(0.5))),
                            //     )
                            //   ]),
                            // )

                            Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final DataTernak domba = data[index];
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
                                            margin: const EdgeInsets.only(
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
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 15, top: 15),
                                                        child: Text(
                                                            "${data[index].fase}",
                                                            style: semibold
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF24408E),
                                                            )),
                                                      ),
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
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              left: 25,
                                                              bottom: 10),
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "Berat",
                                                              style: regular.copyWith(
                                                                  color: const Color(
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
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      child: Center(
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                              "ID",
                                                              style: regular
                                                                  .copyWith(
                                                                color: const Color(
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        floatingActionButton: FloatingActionButton(
                          backgroundColor: const Color(0xFFFFCC29),
                          // tooltip: 'Masukkan id ternak anda',
                          onPressed: () => showSearch(
                            context: context,
                            delegate: SearchPage<DataTernak>(
                              barTheme: ThemeData(
                                appBarTheme: const AppBarTheme(
                                  color: Color(0xFFFFCC29),
                                  elevation: 0,
                                  titleTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  iconTheme: IconThemeData(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              itemStartsWith: true,
                              itemEndsWith: true,
                              onQueryUpdate: (s) => print(s),
                              items: data,
                              searchLabel: 'Masukkan id ternak anda',
                              searchStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.amber),
                              failure: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/image/404.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('ID ternak tidak ditemukan',
                                        style: medium.copyWith(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                    255, 0, 0, 0)
                                                .withOpacity(0.5))),
                                  ],
                                ),
                              ),
                              filter: (domba) => [
                                "${domba.nomor}",
                                "${domba.fase}",
                                "${domba.beratBerkala}",
                              ],
                              builder: (domba) => GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Detailternak(),
                                    settings: RouteSettings(
                                      arguments: domba.idTernak.toString(),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          margin: const EdgeInsets.only(
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
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              top: 15),
                                                      child: Text(
                                                          "${domba.fase}",
                                                          style:
                                                              semibold.copyWith(
                                                            color: const Color(
                                                                0xFF24408E),
                                                          )),
                                                    ),
                                                  ]),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 7,
                                                            left: 25,
                                                            bottom: 10),
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Berat",
                                                            style: regular.copyWith(
                                                                color: const Color(
                                                                    0xFF646464),
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            "${domba.beratBerkala} Kg",
                                                            style: semibold
                                                                .copyWith(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 7,
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 10),
                                                    child: Center(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "ID",
                                                            style: regular
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF646464),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${domba.nomor}",
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          child: const Icon(Icons.search),
                        ),
                      );
                    }
                  }
                  return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2.9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Color.fromARGB(0, 255, 255, 255)
                                          .withOpacity(0.5),
                                      BlendMode.dstATop),
                                  image: AssetImage("assets/image/sad1.png"))),
                        ),
                        Text("Data Ternak kosong",
                            style: semibold.copyWith(
                                fontSize: 25,
                                color: Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5))),
                      ]));
                });
          }
          return Container();
        });
  }
}

void searchPage() {}
