class chartBerat {
  bool? status;
  List<Databerat>? data;

  chartBerat({this.status, this.data});

  chartBerat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Databerat>[];
      json['data'].forEach((v) {
        data!.add(new Databerat.fromJson(v));
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

class Databerat {
  // int? idTernak;
  String? tanggal;
  double? beratBerkala;
  double? suhuBerkala;

  Databerat({this.beratBerkala, this.suhuBerkala, this.tanggal});

  Databerat.fromJson(Map<String, dynamic> json) {
    // idTernak = json['id_ternak'];
    beratBerkala = json['berat_berkala'].toDouble();
    suhuBerkala = json['suhu_berkala'].toDouble();
    tanggal = (json['tanggal']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id_ternak'] = this.idTernak;
    data['berat_berkala'] = this.beratBerkala;
    data['suhu_berkala'] = this.suhuBerkala;
    data['tanggal'] = this.tanggal;
    return data;
  }
}
