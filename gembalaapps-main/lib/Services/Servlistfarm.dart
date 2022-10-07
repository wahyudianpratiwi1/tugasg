// To parse this JSON data, do
//
//     final listMitra = listMitraFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mbech/Services/Servdataternak.dart';
import 'package:flutter/cupertino.dart';

class ListMitra {
  bool? status;
  List<DataMitra>? data;

  ListMitra({this.status, this.data});

  ListMitra.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataMitra>[];
      json['data'].forEach((v) {
        data!.add(new DataMitra.fromJson(v));
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

class DataMitra {
  DataMitra({
    this.no,
    this.idUsers,
    this.foto,
    this.namaMitra,
    this.username,
    this.email,
    this.noHp,
    this.alamat,
    this.level,
    this.jumlahTernak,
  });

  int? no;
  int? idUsers;
  dynamic? foto;
  String? namaMitra;
  String? username;
  String? email;
  String? noHp;
  String? alamat;
  List<String>? level;
  int? jumlahTernak;

  DataMitra.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    idUsers = json['id_users'];
    foto = json['foto'];
    namaMitra = json['nama_mitra'];
    username = json['username'];
    email = json['email'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    level = json['level'].cast<String>();
    jumlahTernak = json['jumlah_Ternak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['id_users'] = this.idUsers;
    data['foto'] = this.foto;
    data['nama_mitra'] = this.namaMitra;
    data['username'] = this.username;
    data['email'] = this.email;
    data['no_hp'] = this.noHp;
    data['alamat'] = this.alamat;
    data['level'] = this.level;
    data['jumlah_Ternak'] = this.jumlahTernak;
    return data;
  }
}

Future<ListMitra> getListfarm() async {
  var hasilGet = await http.get(
    Uri.parse("https://be.gembala.sembadafarm.com/api/costumer"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = ListMitra.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }

  throw Exception("Invalid object");
}
