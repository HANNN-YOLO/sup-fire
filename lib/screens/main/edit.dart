import 'package:flutter/material.dart';
import '../custom/appbar_polos.dart';
import '../custom/caption_inputan.dart';
import '../custom/label_1baris_full.dart';
import '../custom/textfield_1baris_full.dart';
import '../custom/dua_tombol_1baris_full.dart';
import '../custom/showdialog_eror.dart';
import '../custom/custom_editfoto.dart';
import 'package:provider/provider.dart';
import '../../providers/profil_provider.dart';

class Edit extends StatelessWidget {
  static const arah = "/edit";

  final TextEditingController nama = TextEditingController();
  final TextEditingController umur = TextEditingController();
  final TextEditingController link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final terima = ModalRoute.of(context)?.settings.arguments as int;
    final pakai = Provider.of<ProfilProvider>(
      context,
    ).mydata.firstWhere((element) => element.id == terima);
    final penghubung = Provider.of<ProfilProvider>(context);

    nama.text = "${pakai.nama}";
    umur.text = "${pakai.umur}";
    link.text = "${pakai.urlphoto}";

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppbarPolos(label: "Halaman Edit", warna: Colors.cyan),

      body: Center(
        child: Container(
          height: 500,
          width: 350,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 10),
              CaptionInputan(label: "Fill In Data"),
              SizedBox(height: 20),
              Label1barisFull(label: "Name"),
              Textfield1barisFull(
                jenis: TextInputType.name,
                bk: TextCapitalization.words,
                ketikan: nama,
                tulis: false,
                label: "Your Name",
              ),
              SizedBox(height: 20),
              Label1barisFull(label: "Old"),
              Textfield1barisFull(
                jenis: TextInputType.number,
                bk: TextCapitalization.none,
                ketikan: umur,
                tulis: false,
                label: "Old You",
              ),
              SizedBox(height: 20),
              Label1barisFull(label: "Photos"),
              Consumer<ProfilProvider>(
                builder: (context, value, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: custom_editfoto(
                      fungsi: () {
                        value.pickimage();
                      },
                      path: value.selectedimage?.path,
                      pathlama: pakai.urlphoto,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Duatombol1barisFull(
                warna1: Colors.red,
                fungsi1: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed("/detail", arguments: pakai.id);
                },
                label1: "Back",
                warna2: Colors.cyan,
                fungsi2: () async {
                  try {
                    await penghubung.updatedata(
                      pakai.id!,
                      nama.text,
                      int.parse(umur.text),
                      penghubung.selectedimage!,
                      pakai.urlphoto!,
                    );
                    await penghubung.clearformphoto();
                    Navigator.of(context).pushReplacementNamed("/home");
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ShowdialogEror(label: "${e.toString()}");
                      },
                    );
                  }
                },
                label2: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
