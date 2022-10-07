import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbech/Services/Servverify.dart';

class pakan {
  bool? status;
  List<Data>? data;

  pakan({this.status, this.data});

  pakan.fromJson(Map<String, dynamic> json) {
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
  int? idPakan;
  String? namaPakan;
  String? deskripsi;
  String? komposisi;
  String? jumlah;

  Data({this.idPakan, this.namaPakan, this.deskripsi, this.komposisi});

  Data.fromJson(Map<String, dynamic> json) {
    idPakan = json['id_pakan'];
    namaPakan = json['nama_pakan'];
    deskripsi = json['deskripsi'];
    komposisi = json['komposisi'];
    jumlah = json['jumlah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pakan'] = this.idPakan;
    data['nama_pakan'] = this.namaPakan;
    data['deskripsi'] = this.deskripsi;
    data['komposisi'] = this.komposisi;
    return data;
  }
}

Future<pakan> getpakan(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/pakan/list/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = pakan.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }

  return pakan.fromJson(jsonDecode(hasilGet.body));
}
