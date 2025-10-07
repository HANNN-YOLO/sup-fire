import 'dart:convert';

import '../models/profil_models.dart';
import '../configs/supabase_api_config.dart';
import 'package:http/http.dart' as htpp;
import 'package:image_picker/image_picker.dart';

class ProfilService {
  Future<String> uploadPhotoAndGetUrl(XFile photoFile) async {
    final String fileName = '${photoFile.name}';

    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/storage/v1/object/coba_foto/$fileName",
    );

    final bytes = await photoFile.readAsBytes();

    var response = await htpp.post(
      url,
      headers: {
        'Content-Type': 'image/${photoFile.name.split('.').last}',
        'Authorization':
            'Bearer ${SupabaseApiConfig.apikey}', // Wajib untuk Storage API
        'apikey': '${SupabaseApiConfig.apikey}',
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      final publicUrl =
          "${SupabaseApiConfig.masterurl}/storage/v1/object/public/coba_foto/$fileName";
      return publicUrl;
    } else {
      throw "Gagal Mengunggah Foto: ${response.body}";
    }
  }

  Future<void> deletePhotoByUrl(String urlphoto) async {
    final uri = Uri.parse(urlphoto);
    final pathSegments = uri.pathSegments;

    final fileName = pathSegments.last;

    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/storage/v1/object/coba_foto",
    );

    var response = await htpp.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SupabaseApiConfig.apikey}',
        'apikey': '${SupabaseApiConfig.apikey}',
      },
      body: json.encode({
        'prefixes': [fileName],
      }),
    );

    if (response.statusCode == 200) {
      print("done ${response.body}");
    } else {
      print("Gagal Hapus Foto dari Storage: ${response.body}");
      throw "Gagal Hapus Foto dari Storage: ${response.body}";
    }
    print("Foto $fileName berhasil dihapus dari Storage.");
  }

  Future<void> createdata(String nama, int umur, String urlphoto) async {
    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/rest/v1/rest_supabase_linkphoto",
    );

    final isian = ProfilModels(nama: nama, umur: umur, urlphoto: urlphoto);

    var pengsian = await htpp.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${SupabaseApiConfig.apikey}',
      },
      body: json.encode(isian.toJson()),
    );

    if (pengsian.statusCode == 200 || pengsian.statusCode == 201) {
      print("done ${pengsian.body}");
    } else {
      throw "Gagal Mengisi data ${pengsian.body}";
    }
  }

  Future<List<ProfilModels>> readdata() async {
    List<ProfilModels> hasilnya = [];

    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/rest/v1/rest_supabase_linkphoto",
    );

    var simpan = await htpp.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'apikey': "${SupabaseApiConfig.apikey}",
      },
    );

    if (simpan.statusCode == 200 || simpan.statusCode == 201) {
      final save = json.decode(simpan.body) as List<dynamic>;
      save.forEach((value) {
        var item = ProfilModels.fromJson(value);
        hasilnya.add(item);
      });
    } else {
      throw "Gagal mengambil data ${simpan.body}";
    }
    return hasilnya;
  }

  Future<void> deletedata(int id) async {
    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/rest/v1/rest_supabase_linkphoto?id=eq.$id",
    );

    var hapus = await htpp.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${SupabaseApiConfig.apikey}',
      },
    );

    if (hapus.statusCode == 204) {
      print("Done ${hapus.body}");
    } else {
      throw "Gagal Hapus ${hapus.body}";
    }
  }

  Future<void> updatedata(
    int id,
    String nama,
    int umur,
    String urlphoto,
    DateTime eidtan,
  ) async {
    var url = Uri.parse(
      "${SupabaseApiConfig.masterurl}/rest/v1/rest_supabase_linkphoto?id=eq.$id",
    );

    final update = ProfilModels(
      nama: nama,
      umur: umur,
      urlphoto: urlphoto,
      updatedAt: eidtan,
    );

    var upgrade = await htpp.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${SupabaseApiConfig.apikey}',
      },
      body: json.encode(update.toJson()),
    );

    if (upgrade.statusCode == 204) {
      print("Done ${upgrade.body}");
    } else {
      throw "Gagal update ${upgrade.body}";
    }
  }
}
