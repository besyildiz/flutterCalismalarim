import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class etkinListeOrnek extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrenciVerileriniGetir();
    return ListView.separated(
      separatorBuilder: (context, index) {
        if (index % 4 == 0 && index != 0) {
          return Container(
            height: 2,
            color: Colors.blue,
            margin: EdgeInsets.all(4),
          );
        } else
          return Container();
      },
      itemCount: 20,
      //itemBuilder: (context, index) => Card(),
      itemBuilder: (context, index) {
        return Card(
          color: index % 2 == 0 ? Colors.red.shade200 : Colors.purple.shade300,
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.perm_contact_calendar),
            title: Text(tumOgrenciler[index]._isim),
            subtitle: Text(tumOgrenciler[index]._aciklama),
            trailing: Icon(Icons.add),
            onTap: () {
              debugPrint(tumOgrenciler[index].toString());
              toasMesajGoster(index, false);
              alertDialogGoster(context, index);
            },
            onLongPress: () {
              debugPrint("Uzun basılan eleman $index");
              toasMesajGoster(index, true);
            },
          ),
        );
      },
    );
  }

  void ogrenciVerileriniGetir() {
    tumOgrenciler = List.generate(
        300,
        (index) => Ogrenci("Ogrenci $index adı", "Ogrenci $index açıklaması",
            index % 2 == 0 ? true : false));
  }

  void toasMesajGoster(int index, bool uzunBasilma) {
    Fluttertoast.showToast(
        msg: uzunBasilma
            ? "uzun basıldı: " + tumOgrenciler[index].toString()
            : "tek tıklama " + tumOgrenciler[index].toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        textColor: Colors.black,
        backgroundColor: Colors.green.shade400);
  }

  void alertDialogGoster(BuildContext ctx, int index) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Alert Dialog Başlık"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Öğrenci adı: ${tumOgrenciler[index]._isim}"),
                   Text("Açıklaması: ${tumOgrenciler[index]._aciklama}"),
                ],
              ),
            ),
            actions: <Widget>[
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {Navigator.of(ctx).pop();},
                      child: Text("Tamam"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Kapat"),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}

class Ogrenci {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenci(this._isim, this._aciklama, this._cinsiyet); // yapıcı metot

  @override
  String toString() {
    return "Seçilen öğrenci adı: $_isim açıklaması $_aciklama";
  }
}
