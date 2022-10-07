import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbech/data/usershared.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Verif {
  int? id;
  String? user;
  String? name;
  String? level;
  String? time;
  String? v;
  int? iat;
  int? exp;

  Verif(
      {this.id,
      this.user,
      this.name,
      this.level,
      this.time,
      this.v,
      this.iat,
      this.exp});

  Verif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    name = json['name'];
    level = json['level'];
    time = json['time'];
    v = json['v'];
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['level'] = this.level;
    data['time'] = this.time;
    data['v'] = this.v;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    return data;
  }
}

Future<Verif> verify(String token) async {
  String baseURL = "https://be.gembala.sembadafarm.com";
  // "?token=" + token;
  var response = await http.post(Uri.parse("$baseURL/api/verify"), headers: {
    "Authorization": "Bearer $baseURL"
  }, body: {
    "token": token,
  });
  print(response.statusCode);
  var jsonObject = json.decode(response.body);
  print("Response verify : ${response.body.toString()}");

  //SAVE VERIFY STRING
  Usershared.saveVerifyString(response.body.toString());
  return Verif.fromJson(jsonObject.data);
  // if (response.statusCode == 200) {
  //   var jsonObject = json.decode(response.body);
  //   print("Response login : ${response.body.toString()}");
  //   return Verif.fromJson(jsonObject);
}
// }
