import 'package:flutter/material.dart';
import '../custom/appbar_polos.dart';
import '../custom/custom_photo_1barisfull.dart';
import '../custom/custom_listtile.dart';
import '../custom/dua_tombol_1baris_full.dart';
import 'package:provider/provider.dart';
import '../../providers/profil_provider.dart';

class Detail extends StatelessWidget {
  static const arah = "/detail";
  @override
  Widget build(BuildContext context) {
    final terima = ModalRoute.of(context)?.settings.arguments as int;
    final pakai = Provider.of<ProfilProvider>(
      context,
    ).mydata.firstWhere((element) => element.id == terima);

    return Scaffold(
      appBar: AppbarPolos(label: "Halamn Detail", warna: Colors.cyan),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10),
            custom_photo_1barisfull(path: pakai.urlphoto!),
            CustomListtile(label: "Nama", label2: "${pakai.nama}"),
            CustomListtile(label: "Umur", label2: "${pakai.umur}"),
            CustomListtile(label: "Data Utama", label2: "Data Tambahan"),
            CustomListtile(label: "Data Utama", label2: "Data Tambahan"),
            CustomListtile(label: "Data Utama", label2: "Data Tambahan"),
            SizedBox(height: 20),
            Duatombol1barisFull(
              warna1: Colors.red,
              fungsi1: () {
                Navigator.of(context).pushReplacementNamed("/home");
              },
              label1: "Back",
              warna2: Colors.cyan,
              fungsi2: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed("/edit", arguments: pakai.id);
              },
              label2: "Upgrade Data",
            ),
          ],
        ),
      ),
    );
  }
}
