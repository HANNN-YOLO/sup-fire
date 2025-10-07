import 'package:flutter/material.dart';
import '../services/profil_service.dart';
import '../models/profil_models.dart';
import 'package:image_picker/image_picker.dart';

class ProfilProvider with ChangeNotifier {
  List<ProfilModels> _mydata = [];
  List<ProfilModels> get mydata => _mydata;
  int get semuanya => _mydata.length;
  final ProfilService _ref = ProfilService();

  XFile? _selectedimage;
  XFile? get selectedimage => _selectedimage;

  bool? _keadaan = false;
  bool? get keadaan => _keadaan;

  void loading() {
    _keadaan == true;
    notifyListeners();
  }

  Future<void> pickimage() async {
    final pilihan = ImagePicker();
    final pickedimage = await pilihan.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      _selectedimage = pickedimage;
    }
    notifyListeners();
  }

  Future<void> clearformphoto() async {
    _selectedimage = null;
    notifyListeners();
  }

  Future<void> aset(String? sementara) async {
    sementara = null;
    notifyListeners();
  }

  Future<void> createdata(String nama, int umur, XFile photourl) async {
    try {
      final String urlphoto = await _ref.uploadPhotoAndGetUrl(photourl);
      await _ref.createdata(nama, umur, urlphoto);
    } catch (e) {
      throw e;
    }
    await readdata();
    notifyListeners();
  }

  Future<void> readdata() async {
    try {
      final hasilnya = await _ref.readdata();
      _mydata = hasilnya;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> deletedata(int id) async {
    await readdata();
    final detek = _mydata.firstWhere((element) => element.id == id);
    final dapat = detek.urlphoto;
    try {
      await _ref.deletePhotoByUrl(dapat!);
      await _ref.deletedata(id);
    } catch (e) {
      throw e;
    }
    await readdata();
    notifyListeners();
  }

  Future<void> updatedata(
    int id,
    String nama,
    int umur,
    XFile urlphoto,
    String last,
  ) async {
    final editan = DateTime.now();
    try {
      await _ref.deletePhotoByUrl(last);
      print("Foto lama dihapus: $last");

      String newUrlPhoto = await _ref.uploadPhotoAndGetUrl(urlphoto);
      print("Foto baru diunggah: $newUrlPhoto");

      await _ref.updatedata(id, nama, umur, newUrlPhoto, editan);
    } catch (e) {
      throw e;
    }
    await readdata();
    notifyListeners();
  }

  ProfilProvider() {
    readdata();
  }
}
