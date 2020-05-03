import 'package:flutter/material.dart';

class FormveTextFormField extends StatefulWidget {
  @override
  _FormveTextFormFieldState createState() => _FormveTextFormFieldState();
}

class _FormveTextFormFieldState extends State<FormveTextFormField> {
  String _adSoyad, _sifre, _emailAdres;
  bool otomatikKontrol = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.green,
        primaryColor: Colors.red,
        errorColor: Colors.cyan,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        appBar: AppBar(
          title: Text("Form ve TextFormField"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            autovalidate: otomatikKontrol,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.supervisor_account),
                    hintText: "Adınız ve soyadınız",
                    labelText: "Ad soyadı",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
// initialValue: "ekrem", // ilk değeri oluyor ve hint kayboluyor
                  validator: _ismiOnayla,
                  onSaved: (deger) => _adSoyad = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email adresiniz",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                      color: Colors.pink,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purpleAccent, width: 2)),
                  ),
                  validator: _emailKontrol,
                  onSaved: (deger) => _emailAdres = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Şifreniz",
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purpleAccent, width: 2)),
                  ),
                  validator: (String girilenVeri) {
                    if (girilenVeri.length < 6)
                      return "En az 6 karakter gerekli";
                  },
                  onSaved: (deger) => _sifre = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton.icon(
                  color: Colors.blueAccent,
                  disabledColor: Colors.amber,
                  label: Text("KAYDET"),
                  icon: Icon(Icons.save),
                  onPressed: _girisBilgileriniOnayla,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Girilen mail: $_emailAdres şifre: $_sifre adsoyad: $_adSoyad");
    }else
      setState(() {
        otomatikKontrol=true;
      });


  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(mail)) ? "Geçersiz eposta" : null;
  }

  String _ismiOnayla(String isim) {
    RegExp kontrol = RegExp('^[a-zA-ZüÜğĞİışŞçÇöÖ]+\$');
    if (!kontrol.hasMatch(isim))
      return "İsim numara içermemeli";
    else
      return null;
  }
}
