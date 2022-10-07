import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servpakan.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Detail/Detail_pakan.dart';
import 'package:mbech/util/constant.dart';

class Datapakan extends StatefulWidget {
  const Datapakan({Key? key}) : super(key: key);

  @override
  State<Datapakan> createState() => DatapakanState();
}

class DatapakanState extends State<Datapakan> {
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
          'Data Pakan',
          style: semibold.copyWith(
              fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: FutureBuilder(
          future: Usershared.getVerify(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              var verify = Verif.fromJson(jsonDecode(snapshot.data.toString()));
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
                        return ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final Data itempakan = data[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const detailPakan(),
                                        settings: RouteSettings(
                                          arguments: itempakan,
                                        ),
                                      ));
                                  print(itempakan);
                                  // Navigator.pushNamed(context, '/detail_pakan',
                                  //     arguments: itempakan.idPakan);
                                },
                                child: SizedBox(
                                  height: 100,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 16, left: 16, right: 16),
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
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 16, bottom: 10),
                                          child: Column(
                                            children: [
                                              Text("${data[index].namaPakan}",
                                                  style: semibold.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF24408E),
                                                  )),
                                              Text(
                                                  "Stok : ${data[index].jumlah == "N/A" ? "0" : data[index].jumlah}",
                                                  style: semibold.copyWith(
                                                    fontSize: 16,
                                                    color: Color(0xFF24408E),
                                                  )),
                                            ],
                                          ),
                                        ),
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
                              height: MediaQuery.of(context).size.height / 2.9,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: new ColorFilter.mode(
                                          Color(0x00EFEFF2).withOpacity(0.5),
                                          BlendMode.dstATop),
                                      image:
                                          AssetImage("assets/image/sad1.png"))),
                            ),
                            Text("Data Pakan Kosong",
                                style: medium.copyWith(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.5))),
                          ]));
                    }
                  });
            }
            return Center(
              child: Text(""),
            );
          }),
    );
  }
}
