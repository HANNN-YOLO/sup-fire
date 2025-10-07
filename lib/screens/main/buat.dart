import 'package:flutter/material.dart';
import '../custom/appbar_polos.dart';
import '../custom/caption_inputan.dart';
import '../custom/label_1baris_full.dart';
import '../custom/textfield_1baris_full.dart';
import '../custom/dua_tombol_1baris_full.dart';
import '../custom/custom_UploadFoto.dart';
import '../custom/showdialog_eror.dart';
import 'package:provider/provider.dart';
import '../../providers/profil_provider.dart';

class Buat extends StatelessWidget {
  static const arah = "/buat";
  final TextEditingController nama = TextEditingController();
  final TextEditingController umur = TextEditingController();
  final TextEditingController link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final penghubung = Provider.of<ProfilProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppbarPolos(label: "Halaman Buat", warna: Colors.cyan),

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
                    child: CustomUploadfoto(
                      tinggi: 150,
                      radius: 12,
                      fungsi: () {
                        value.pickimage();
                      },
                      path: value.selectedimage?.path,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Duatombol1barisFull(
                warna1: Colors.red,
                fungsi1: () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
                label1: "Back",
                warna2: Colors.cyan,
                fungsi2: () async {
                  try {
                    await penghubung.createdata(
                      nama.text,
                      int.parse(umur.text),
                      // link.text,
                      penghubung.selectedimage!,
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
