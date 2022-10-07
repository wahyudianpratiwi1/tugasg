import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mbech/Services/Servverify.dart';

class chartSakit {
  bool? status;
  List<Datasakit>? data;

  chartSakit({this.status, this.data});

  chartSakit.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Datasakit>[];
      json['data'].forEach((v) {
        data!.add(new Datasakit.fromJson(v));
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

class Datasakit {
  String? namaPenyakit;
  int? jumlah;

  Datasakit({this.namaPenyakit, this.jumlah});

  Datasakit.fromJson(Map<String, dynamic> json) {
    namaPenyakit = json['nama_penyakit'];
    jumlah = json['Jumlah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_penyakit'] = this.namaPenyakit;
    data['Jumlah'] = this.jumlah;
    return data;
  }
}

Future<chartSakit> getsakit(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/ternak/totalternaksakit/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = chartSakit.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }
  return chartSakit.fromJson(json.decode(hasilGet.body));
}

// https://be.gembala.sembadafarm.com/api/kesehatan/list/10