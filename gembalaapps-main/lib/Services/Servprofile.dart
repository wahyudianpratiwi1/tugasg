import 'dart:io';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbech/Services/Servverify.dart';

class DataProfile {
  int? idUsers;
  String? namaMitra;
  String? username;
  String? email;
  String? noHp;
  String? alamat;
  String? foto;

  DataProfile(
      {this.idUsers,
      this.namaMitra,
      this.username,
      this.email,
      this.noHp,
      this.alamat,
      this.foto});

  factory DataProfile.fromJson(Map<String, dynamic> json) {
    return DataProfile(
      idUsers: json['id_users'],
      namaMitra: json['nama_mitra'],
      username: json['username'],
      email: json['email'],
      noHp: json['no_hp'],
      alamat: json['alamat'],
      foto: json['foto'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_users'] = this.idUsers;
    data['nama_mitra'] = this.namaMitra;
    data['username'] = this.username;
    data['email'] = this.email;
    data['no_hp'] = this.noHp;
    data['alamat'] = this.alamat;
    data['foto'] = this.foto;
    return data;
  }

  static Future<DataProfile> connectToApi(String idusers, String nama_mitra,
      String username, String email, String no_hp, String alamat) async {
    String apiURL = "https://be.gembala.sembadafarm.com/api/costumer";

    var apiResult = await http.post(Uri.parse(apiURL), body: {
      "id_users": idusers,
      "nama_mitra": nama_mitra,
      "username": username,
      "email": email,
      "no_hp": no_hp,
      "alamat": alamat,
    });
    var jsonObject = json.decode(apiResult.body);
    print("Response Signup : ${apiResult.body.toString()}");
    return DataProfile.fromJson(jsonObject);
  }
}
