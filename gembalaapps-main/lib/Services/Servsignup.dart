import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostRegister {
  final String? nama_mitra;
  final String? username;
  final String? password;
  final String? email;
  final String? no_hp;
  final String? alamat;
  final String? level;

  PostRegister(
      {this.nama_mitra,
      this.username,
      this.password,
      this.email,
      this.no_hp,
      this.alamat,
      this.level});

  factory PostRegister.createdPostRegister(Map<String, dynamic> object) {
    return PostRegister(
      nama_mitra: object['nama_mitra'],
      username: object['username'],
      password: object['password'],
      email: object['email'],
      no_hp: object['no_hp'],
      alamat: object['alamat'],
      level: object['level'],
    );
  }

  static Future<RegistResponse> connectToApi(String nama_mitra, String username,
      String email, String no_hp, String alamat, String password) async {
    String apiURL =
        "https://be.gembala.sembadafarm.com/auth/authentication/register";

    var apiResult = await http.post(Uri.parse(apiURL), body: {
      "nama_mitra": nama_mitra,
      "username": username,
      "email": email,
      "no_hp": no_hp,
      "alamat": alamat,
      "password": password,
      "level": "Non Mitra"
    });
    var jsonObject = json.decode(apiResult.body);
    print("Response Signup : ${apiResult.body.toString()}");
    return RegistResponse.fromJson(jsonObject);
  }
}

class RegistResponse {
  bool? status;
  String? error;
  Data? data;

  RegistResponse({this.status, this.error, this.data});

  RegistResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? error;

  Data({this.username, this.error});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['error'] = this.error;
    return data;
  }
}
