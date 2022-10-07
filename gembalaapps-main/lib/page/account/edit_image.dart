import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbech/Services/Servaccount.dart';
import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Account/Management.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mbech/util/constant.dart';
import 'package:string_validator/string_validator.dart';

import '../../Services/Servprofile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Editimage extends StatefulWidget {
  const Editimage({Key? key}) : super(key: key);

  @override
  State<Editimage> createState() => _EditimageState();
}

class _EditimageState extends State<Editimage> {
  final _formKey = GlobalKey<FormState>();
  final namaMitra = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final no_hp = TextEditingController();
  final alamat = TextEditingController();
  var iduser;
  var foto;
  DataProfile? dataProfile;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String?>;

    if (args != null) {
      if (args[1]!.isNotEmpty) {
        namaMitra.text = args[1] as String;
      }
      if (args[2]!.isNotEmpty) {
        username.text = args[2] as String;
      }
      if (args[5]!.isNotEmpty) {
        email.text = args[5] as String;
      }
      if (args[4]!.isNotEmpty) {
        no_hp.text = args[4] as String;
      }
      if (args[3]!.isNotEmpty) {
        alamat.text = args[3] as String;
      }
      if (args[0]!.isNotEmpty) {
        iduser = args[0] as String;
      }
      if (args[5]!.isNotEmpty) {
        foto = args[5] as String;
      }
      // nama_mitra.text = args[0];
      // username.text = args[1];
      // email.text = args[2];
      // no_hp.text = args[3];
      // alamat.text = args[4];
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff24408E),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Kembali",
            style: TextStyle(
                fontFamily: "poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff24408E)),
          ),
        ),
        body: Center(
            child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //     padding:
                      //         const EdgeInsets.only(top: 10, bottom: 10),
                      //     child: Container(
                      //         width: 150,
                      //         height: 150,
                      //         child: GestureDetector(
                      //           onTap: () async {
                      //             final image = await ImagePicker()
                      //                 .pickImage(
                      //                     source: ImageSource.gallery);

                      //             if (image == null) return;

                      //             final location =
                      //                 await getApplicationDocumentsDirectory();
                      //             final name = basename(image.path);
                      //             final imageFile =
                      //                 File('${location.path}/$name');
                      //             final newImage = await File(image.path)
                      //                 .copy(imageFile.path);
                      //             setState(() => user =
                      //                 user.copy(imagePath: newImage.path));
                      //           },
                      //           // child: Image.network(user.image),
                      //         ))),
                      FutureBuilder(
                          future: Usershared.getVerify(),
                          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                            if (snapshot.data != null) {
                              var verify = Verif.fromJson(
                                  jsonDecode(snapshot.data.toString()));
                              print("Data verify : ${snapshot.data}");
                              return FutureBuilder<User>(
                                  future: getUser(verify),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
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

                                        return Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
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
                                            );
                                      }
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                            }
                            return Center(child: CircularProgressIndicator());
                          }),

                      Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Nama Anda';
                            } else if (!isAlpha(value)) {
                              //     return 'Hanya Huruf';
                            }
                            return null;
                          },
                          cursorColor: const Color.fromRGBO(0, 0, 0, 0),
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          showCursor: true,
                          controller: namaMitra,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Nama Mitra"),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Username';
                            }
                            return null;
                          },
                          cursorColor: const Color.fromRGBO(0, 0, 0, 0),
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          showCursor: true,
                          controller: username,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Username"),
                        ),
                      ),

                      Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan email Anda';
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          showCursor: true,
                          controller: email,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Email"),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nomor handphone Anda';
                            } else if (isAlpha(value)) {
                              return 'Hanya Angka';
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(0, 0, 0, 0),
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          showCursor: true,
                          controller: no_hp,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "No Hp"),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Alamat Anda';
                            }
                            return null;
                          },
                          cursorColor: const Color.fromRGBO(0, 0, 0, 0),
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          showCursor: true,
                          controller: alamat,
                          decoration: kTextFiledInputDecoration.copyWith(
                              labelText: "Alamat"),
                        ),
                      ),
                      Container(
                          width: 100,
                          height: 45,
                          margin: const EdgeInsets.only(top: 22, bottom: 50),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff24408E)),
                              child: const Text(
                                "Kirim",
                                style: TextStyle(
                                    fontFamily: 'poppins', color: Colors.white),
                              ),
                              onPressed: () async {
                                DataProfile.connectToApi(
                                        iduser,
                                        namaMitra.text,
                                        username.text,
                                        email.text,
                                        no_hp.text,
                                        alamat.text)
                                    .then((value) {
                                  dataProfile = value;
                                  print("idusers : ${dataProfile!.username}");
                                  if (dataProfile!.username == null) {
                                    Navigator.pop(context);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "errorrrrr",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 12.0);
                                  }
                                });
                              })),
                    ],
                  ),
                ))));
  }
}
