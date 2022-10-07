import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbech/Services/Servverify.dart';

class totalKondisi {
  bool? status;
  List<Datatotal>? data;

  totalKondisi({this.status, this.data});

  totalKondisi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Datatotal>[];
      json['data'].forEach((v) {
        data!.add(new Datatotal.fromJson(v));
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

class Datatotal {
  List<String>? statusSehat;
  int? jumlah;

  Datatotal({this.statusSehat, this.jumlah});

  Datatotal.fromJson(Map<String, dynamic> json) {
    statusSehat = json['status_sehat'].cast<String>();
    jumlah = json['Jumlah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_sehat'] = this.statusSehat;
    data['Jumlah'] = this.jumlah;
    return data;
  }
}

Future<totalKondisi> getTotalkondisi(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/ternak/totalsehat/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = totalKondisi.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }
  return totalKondisi.fromJson(jsonDecode(hasilGet.body));
}
