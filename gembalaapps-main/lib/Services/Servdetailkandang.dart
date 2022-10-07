import 'package:flutter/cupertino.dart';

class detailKandang {
  bool? status;
  List<Datadetail>? data;

  detailKandang({this.status, this.data});

  detailKandang.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Datadetail>[];
      json['data'].forEach((v) {
        data!.add(new Datadetail.fromJson(v));
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

class Datadetail {
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
  int? idInduk;
  int? idPejantan;
  List<String>? statusSehat;
  String? namaPenyakit;
  String? fase;
  String? namaKandang;
  String? namaPakan;
  String? tanggalKeluar;
  String? statusKeluar;

  Datadetail(
      {this.nomor,
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
      this.idInduk,
      this.idPejantan,
      this.statusSehat,
      this.namaPenyakit,
      this.fase,
      this.namaKandang,
      this.namaPakan,
      this.tanggalKeluar,
      this.statusKeluar});

  Datadetail.fromJson(Map<String, dynamic> json) {
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
    idInduk = json['id_induk'];
    idPejantan = json['id_pejantan'];
    statusSehat = json['status_sehat'].cast<String>();
    namaPenyakit = json['nama_penyakit'];
    fase = json['fase'];
    namaKandang = json['nama_kandang'];
    namaPakan = json['nama_pakan'];
    tanggalKeluar = json['tanggal_keluar'];
    statusKeluar = json['status_keluar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['id_users'] = this.idUsers;
    data['id_ternak'] = this.idTernak;
    data['rf_id'] = this.rfId;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['nama_varietas'] = this.namaVarietas;
    data['berat_berkala'] = this.beratBerkala;
    data['suhu_berkala'] = this.suhuBerkala;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['umur'] = this.umur;
    data['tanggal_masuk'] = this.tanggalMasuk;
    data['id_induk'] = this.idInduk;
    data['id_pejantan'] = this.idPejantan;
    data['status_sehat'] = this.statusSehat;
    data['nama_penyakit'] = this.namaPenyakit;
    data['fase'] = this.fase;
    data['nama_kandang'] = this.namaKandang;
    data['nama_pakan'] = this.namaPakan;
    data['tanggal_keluar'] = this.tanggalKeluar;
    data['status_keluar'] = this.statusKeluar;
    return data;
  }
}
