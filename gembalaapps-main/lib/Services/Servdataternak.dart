import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mbech/Services/Servverify.dart';
import 'dart:convert';

import 'package:mbech/data/usershared.dart';
import 'package:mbech/page/Beranda/Data_ternak.dart';

class Ternak {
  bool? status;
  List<DataTernak>? data;

  Ternak({this.status, this.data});

  Ternak.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataTernak>[];
      json['data'].forEach((v) {
        data!.add(new DataTernak.fromJson(v));
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

class DataTernak {
  int? nomor;
  int? idUsers;
  int? idTernak;
  String? rfId;
  List<String>? jenisKelamin;
  String? namaVarietas;
  double? beratBerkala;
  double? suhuBerkala;
  String? tanggalLahir;
  int? umur;
  String? tanggalMasuk;
  List<String>? statusSehat;
  // List<String>? fasePemeliharaan;
  String? fase;
  String? namaKandang;
  String? namaPakan;
  int? idInduk;
  int? idPejantan;
  String? tanggalKeluar;
  // String? statusKeluar;

  DataTernak({
    this.nomor,
    this.idUsers,
    this.idTernak,
    this.rfId,
    this.jenisKelamin,
    this.namaVarietas,
    this.beratBerkala,
    this.suhuBerkala,
    this.tanggalLahir,
    this.umur,
    this.tanggalMasuk,
    this.statusSehat,
    this.fase,
    this.namaKandang,
    this.namaPakan,
    this.idInduk,
    this.idPejantan,
    this.tanggalKeluar,
    // this.statusKeluar
  });

  DataTernak.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    idUsers = json['id_users'];
    idTernak = json['id_ternak'];
    rfId = json['rf_id'];
    jenisKelamin = json['jenis_kelamin'].cast<String>();
    namaVarietas = json['nama_varietas'];
    beratBerkala = json['berat_berkala'].toDouble();
    suhuBerkala = json['suhu_berkala'].toDouble();
    tanggalLahir = json['tanggal_lahir'];
    umur = json['umur'];
    tanggalMasuk = json['tanggal_masuk'];
    statusSehat = json['status_sehat'].cast<String>();
    fase = json['fase'];
    namaKandang = json['nama_kandang'];
    namaPakan = json['nama_pakan'];
    idInduk = json['id_induk'];
    idPejantan = json['id_pejantan'];
    tanggalKeluar = json['tanggal_keluar'];
    // statusKeluar = json['status_keluar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['id_users'] = this.idUsers;
    data['id_ternak'] = this.idTernak;
    data['rf_id'] = this.rfId;
    // data['jenis_kelamin'] as String;
    data['nama_varietas'] = this.namaVarietas;
    data['berat_berkala'] = this.beratBerkala;
    data['suhu_berkala'] = this.suhuBerkala;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['umur'] = this.umur;
    data['tanggal_masuk'] = this.tanggalMasuk;
    data['status_sehat'] = this.statusSehat;
    data['fase'] = this.fase;
    data['nama_kandang'] = this.namaKandang;
    data['nama_pakan'] = this.namaPakan;
    data['id_induk'] = this.idInduk;
    data['id_pejantan'] = this.idPejantan;
    data['tanggal_keluar'] = this.tanggalKeluar;
    // data['status_keluar'] = this.statusKeluar;
    return data;
  }
}

Future<Ternak> ambilData(Verif? verify) async {
  print("Verify id : ${verify?.id}");
  var hasilGet = await http.get(
    Uri.parse(
        "https://be.gembala.sembadafarm.com/api/ternak/users/${verify?.id ?? -1}"),
  );
  print(hasilGet.statusCode);
  if (hasilGet.statusCode == 200) {
    var data = jsonDecode(hasilGet.body);
    var dataRes = Ternak.fromJson(data);
    debugPrint("Response : $data");
    return dataRes;
  }

  return Ternak.fromJson(jsonDecode(hasilGet.body));
}

// Total Ternak FasePemeliharaan by id_user : https://be.gembala.sembadafarm.com/api/ternak/totalfase/10
// Total Ternak by Kesehatan : https://be.gembala.sembadafarm.com/api/ternak/totalsehat/10
// Get List Kesehatan by Id_ternak : https://be.gembala.sembadafarm.com/api/kesehatan/listkesehatan/170