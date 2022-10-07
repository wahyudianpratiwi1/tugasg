import 'package:flutter/material.dart';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Trading/Detail_mitra.dart';
import 'package:mbech/Services/Servlistfarm.dart';

class Listmitra extends StatefulWidget {
  const Listmitra({Key? key}) : super(key: key);

  @override
  State<Listmitra> createState() => _ListmitraState();
}

class _ListmitraState extends State<Listmitra> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(100, (i) => "Item $i");
  var items = [];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCC29),
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff000000),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("List Mitra",
            style: semibold.copyWith(
                fontSize: 16, color: const Color(0xff000000))),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10, left: 7),
            width: 380,
            height: 70,
            child: Center(
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                textAlign: TextAlign.start,
                controller: editingController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5),
                    hintText: "Search by farm name",
                    hintStyle: regular.copyWith(color: const Color(0xFF8193AD)),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ),
          FutureBuilder<ListMitra>(
              future: getListfarm(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<DataMitra>? data = snapshot.data?.data;
                  if (data != null) {
                    for (int v = 0; v < data.length; v++) {}
                    return Expanded(
                        child: ListView.builder(
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
                                            const Detailmitra(),
                                        settings: RouteSettings(
                                          arguments: data[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 10,
                                        bottom: 10),
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
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10, bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("${data[index].namaMitra}",
                                                  style: bold.copyWith(
                                                      fontSize: 16,
                                                      color:
                                                          Color(0xff24408E))),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/image/sheep1.png"))),
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "populasi",
                                                        style: regular.copyWith(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff646464)),
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "${data[index].jumlahTernak}",
                                                        style: regular.copyWith(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff646464)),
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "ternak",
                                                        style: regular.copyWith(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff646464)),
                                                      ))
                                                ],
                                              ),
                                              Text(
                                                "${data[index].alamat}",
                                                style: semibold.copyWith(
                                                    fontSize: 10,
                                                    color: Color(0xFF000000)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                  }
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
