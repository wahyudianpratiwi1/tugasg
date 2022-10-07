class detailSakit {
  bool? status;
  List<Data>? data;

  detailSakit({this.status, this.data});

  detailSakit.fromJson(Map<String, dynamic> json) {
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
