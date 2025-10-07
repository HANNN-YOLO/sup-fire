import 'package:flutter/material.dart';
import '../custom/appbar_polos.dart';
import '../custom/satu_tombol.dart';
import '../custom/custom_listtile_delete.dart';
import '../custom/showdialog_eror.dart';
import 'package:provider/provider.dart';
import '../../providers/profil_provider.dart';

class Home extends StatelessWidget {
  static const arah = "/home";
  @override
  Widget build(BuildContext context) {
    final penghubung = Provider.of<ProfilProvider>(context);
    return Scaffold(
      appBar: AppbarPolos(label: "Halaman Home", warna: Colors.cyan),

      body:
          penghubung.semuanya == 0
              ? Center(
                child: SatuTombol(
                  warna: Colors.cyan,
                  fungsi: () {},
                  label: "Add Data",
                ),
              )
              : penghubung.keadaan == true
              ? Center(child: CircularProgressIndicator())
              : Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 700,
                      child: ListView.builder(
                        itemCount: penghubung.semuanya,
                        itemBuilder: (context, index) {
                          return CustomListtileDelete(
                            label: "${penghubung.mydata[index].nama}",
                            label1: "${penghubung.mydata[index].umur}",
                            link: "${penghubung.mydata[index].urlphoto}",
                            fungsitap: () {
                              Navigator.of(context).pushReplacementNamed(
                                "/detail",
                                arguments: penghubung.mydata[index].id,
                              );
                            },
                            fungsi: () async {
                              try {
                                await penghubung.deletedata(
                                  penghubung.mydata[index].id!,
                                );
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowdialogEror(
                                      label: "${e.toString()}",
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SatuTombol(
                      warna: Colors.cyan,
                      fungsi: () {
                        Navigator.of(context).pushReplacementNamed("/buat");
                      },
                      label: "Add Data",
                    ),
                  ],
                ),
              ),
    );
  }
}
