import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbech/Services/Servaccount.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Account/toWeb.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:mbech/page/account/management.dart';
import 'package:mbech/widgets/image_widget_Dash.dart';
import 'package:mbech/util/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashaccount extends StatefulWidget {
  const Dashaccount({Key? key}) : super(key: key);

  @override
  State<Dashaccount> createState() => _DashaccountState();
}

class _DashaccountState extends State<Dashaccount> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: Usershared.getVerify(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              var verify = Verif.fromJson(jsonDecode(snapshot.data.toString()));
              print("Data verify : ${snapshot.data}");
              return FutureBuilder<User>(
                  future: getUser(verify),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Data>? data = snapshot.data?.data;
                      if (data != null) {
                        var image = json.encode(data[0].foto);
                        print("image : $image");
                        var image2 = json.decode(image);
                        print("image 2 : $image2");

                        return Column(
                          children: <Widget>[
                            // Container(
                            //   margin: const EdgeInsets.only(top: 50),
                            //   child: DisplayImageDash(
                            //     imagePath: user.image,
                            //   ),
                            // ),
                            Container(
                                margin: const EdgeInsets.only(top: 50),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${image2 == "https://be.gembala.sembadafarm.com/fotoprofil/null" ? "https://img.freepik.com/free-photo/photo-funny-sheep-animal-chewing-food-staring-camera_342744-434.jpg?size=626&ext=jpg&ga=GA1.2.30730343.1644423102" : image2}",
                                            scale: 1
                                            // snapshot.data.data[0].image,
                                            ),
                                        fit: BoxFit.fill))
                                // child: Image.network(
                                //     "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png"),
                                // decoration: BoxDecoration(
                                //   image: Image.network("${data[0].foto)",
                                //       fit: BoxFit.cover),
                                //   // borderRadius: BorderRadius.circular(10),
                                //   // color: Color.fromARGB(255, 255, 255, 255),
                                // ),
                                ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                "${data[0].namaMitra}",
                                style: bold.copyWith(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Management(),
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 350,
                                height: 50,
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Icon(
                                        Icons.person_search,
                                        color: Color((0xFF24408E)),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text("Profile Detail",
                                          style: semibold.copyWith(
                                              color: const Color(0xFF24408E))),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child:
                                          const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const toWeb(),
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 350,
                                height: 50,
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Icon(
                                        Icons.all_inbox,
                                        color: Color((0xFF24408E)),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text("Dashboard",
                                          style: semibold.copyWith(
                                              color: const Color(0xFF24408E))),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child:
                                          const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 350,
                                height: 50,
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Icon(
                                        Icons.logout,
                                        color: Color((0xFF24408E)),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text("Logout",
                                          style: semibold.copyWith(
                                              color: const Color(0xFF24408E))),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child:
                                          const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

void pict() {
  Container(
    child: const Image(
      image: AssetImage("assets/image/mbek1.png"),
      width: 150,
      height: 145,
    ),
  );
}
