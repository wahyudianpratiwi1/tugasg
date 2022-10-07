import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mbech/Services/Servverify.dart';
import 'package:mbech/page/Detail/new.dart';

class Kandang {
  bool? status;
  List<Data>? data;

  Kandang({this.status, this.data});

  Kandang.fromJson(Map<String, dynamic> json) {
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
  String? id_kandang;
  int? jumlahTernak;
  String? namaKandang;
  String? total_berat;

  Data(
      {this.id_kandang, this.jumlahTernak, this.namaKandang, this.total_berat});

  Data.fromJson(Map<String, dynamic> json) {
    id_kandang = json['id_kandang'].toString();
    jumlahTernak = json['Jumlah_ternak'];
    namaKandang = json['nama_kandang'];
    total_berat = json['total_berat']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kandang'] = this.id_kandang;
    data['nama_kandang'] = this.namaKandang;
    data['Jumlah_ternak'] = this.jumlahTernak;
    data['total_berat'] = this.total_berat;
    return data;
  }
}

class jumlahKandang {
  bool? status;
  List<DataJumlah>? data;

  jumlahKandang({this.status, this.data});

  jumlahKandang.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataJumlah>[];
      json['data'].forEach((v) {
        data!.add(new DataJumlah.fromJson(v));
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

class DataJumlah {
  int? jumlahKandang;

  DataJumlah({this.jumlahKandang});

  DataJumlah.fromJson(Map<String, dynamic> json) {
    jumlahKandang = json['Jumlah_kandang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Jumlah_kandang'] = this.jumlahKandang;
    return data;
  }
}

Future<Kandang> getkandang(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/ternak/totalberat/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = Kandang.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }

  return Kandang.fromJson(jsonDecode(hasilGet.body));
}

Future<jumlahKandang> getJumlahkandang(Verif? verify) async {
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/kandang/total/${verify?.id ?? -1}"),
  );

  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);

    var dataRes = jumlahKandang.fromJson(data);

    debugPrint("Response : $data");
    return dataRes;
  }

  throw Center(
    child: Text("Data tidak ditemukan"),
  );
}
