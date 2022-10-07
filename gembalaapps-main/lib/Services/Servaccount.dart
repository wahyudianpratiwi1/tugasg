//------------------------------------------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mbech/Services/Servverify.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool? status;
  List<Data>? data;

  User({this.status, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idUsers;
  String? foto;
  String? namaMitra;
  String? username;
  String? email;
  String? noHp;
  String? alamat;
  List<String>? level;
  int? jumlahTernak;
  int? nomor;

  Data(
      {this.idUsers,
      this.foto,
      this.namaMitra,
      this.username,
      this.email,
      this.noHp,
      this.alamat,
      this.level,
      this.jumlahTernak,
      this.nomor});

  Data.fromJson(Map<String, dynamic> json) {
    idUsers = json['id_users'];
    foto = json['foto'];
    namaMitra = json['nama_mitra'];
    username = json['username'];
    email = json['email'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    level = json['level'].cast<String>();
    jumlahTernak = json['jumlah_Ternak'];
    nomor = json['nomor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_users'] = this.idUsers;
    data['foto'] = this.foto;
    data['nama_mitra'] = this.namaMitra;
    data['username'] = this.username;
    data['email'] = this.email;
    data['no_hp'] = this.noHp;
    data['alamat'] = this.alamat;
    data['level'] = this.level;
    data['jumlah_Ternak'] = this.jumlahTernak;
    data['nomor'] = this.nomor;
    return data;
  }
}

Future<User> getUser(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/costumer/${verify?.id ?? -1}"),
  );
  print(hasilGet.statusCode);
  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = User.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }

  return User.fromJson(jsonDecode(hasilGet.body));
}
