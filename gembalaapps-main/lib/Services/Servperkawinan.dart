import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mbech/Services/Servpakan.dart';
import 'package:mbech/Services/Servverify.dart';

class perkawinan {
  bool? status;
  List<Data>? data;

  perkawinan({this.status, this.data});

  perkawinan.fromJson(Map<String, dynamic> json) {
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
  int? idternak;
  String? tanggalkawin;
  String? idpemancek;

  Data({this.idternak, this.tanggalkawin, this.idpemancek});
  Data.fromJson(Map<String, dynamic> json) {
    idternak = json['id_tenak'];
    tanggalkawin = json['tanggal_kawin'];
    idpemancek = json['id_pemancek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_ternak'] = this.idternak;
    data['tanggal_kawin'] = this.tanggalkawin;
    data['tanggal_kawin'] = this.idpemancek;
    return data;
  }
}

Future<perkawinan> getperkawinan(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse("http://127.0.0.1:51009/api/kawin/${verify?.id ?? -1}"),
  );
  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);
    var dataRes = perkawinan.fromJson(data);
    debugPrint("Response : $data");
    return dataRes;
  }
  return perkawinan.fromJson(jsonDecode(hasilGet.body));
}
