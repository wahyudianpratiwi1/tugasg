import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mbech/Services/Servverify.dart';

class Chart {
  bool? status;
  List<Datachart>? data;

  Chart({this.status, this.data});

  Chart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Datachart>[];
      json['data'].forEach((v) {
        data!.add(new Datachart.fromJson(v));
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

class Datachart {
  String? fase;
  int? jumlahTernak;

  Datachart({
    this.fase,
    this.jumlahTernak,
  });

  Datachart.fromJson(Map<String, dynamic> json) {
    fase = json['fase'];
    jumlahTernak = json['Jumlah_ternak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fase'] = this.fase;
    data['Jumlah_ternak'] = this.jumlahTernak;

    return data;
  }
}

Future<Chart> getfase(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/ternak/totalfase/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = Chart.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }
  return Chart.fromJson(json.decode(hasilGet.body));
}
