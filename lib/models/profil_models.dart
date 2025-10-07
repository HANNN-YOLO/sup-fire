class ProfilModels {
  int? id, umur;
  String? nama, urlphoto;
  DateTime? createdAt, updatedAt;

  ProfilModels({
    this.id,
    required this.nama,
    required this.umur,
    required this.urlphoto,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'nama': nama,
      'umur': umur,
      'urlphoto': urlphoto,
    };

    if (id != null) {
      data['id'] = id;
    }

    if (createdAt != null) {
      data['createdAt'] = createdAt;
    }

    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toIso8601String();
    }

    return data;
  }

  factory ProfilModels.fromJson(Map<String, dynamic> json) {
    return ProfilModels(
      id: json['id'],
      nama: json['nama'],
      umur: json['umur'],
      urlphoto: json['urlphoto'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
