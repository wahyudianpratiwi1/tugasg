import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbech/Services/Servverify.dart';

class Kesehatan {
  bool? status;
  List<Data>? data;

  Kesehatan({this.status, this.data});

  Kesehatan.fromJson(Map<String, dynamic> json) {
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
  int? idKesehatan;
  int? idTernak;
  int? nomor;
  String? namaPenyakit;
  String? tglSakit;
  String? tglSembuh;

  Data(
      {this.idKesehatan,
      this.idTernak,
      this.nomor,
      this.namaPenyakit,
      this.tglSakit,
      this.tglSembuh});

  Data.fromJson(Map<String, dynamic> json) {
    idKesehatan = json['id_kesehatan'];
    idTernak = json['id_ternak'];
    nomor = json['nomor'];
    namaPenyakit = json['nama_penyakit'];
    tglSakit = json['tgl_sakit'];
    tglSembuh = json['tgl_sembuh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kesehatan'] = this.idKesehatan;
    data['id_ternak'] = this.idTernak;
    data['nomor'] = this.nomor;
    data['nama_penyakit'] = this.namaPenyakit;
    data['tgl_sakit'] = this.tglSakit;
    data['tgl_sembuh'] = this.tglSembuh;
    return data;
  }
}

// https://be.gembala.sembadafarm.com/api/kesehatan/listkesehatanusers/10
Future<Kesehatan> getKesehatan(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/kesehatan/listusers/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = Kesehatan.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }
  return Kesehatan.fromJson(json.decode(hasilGet.body));
}
