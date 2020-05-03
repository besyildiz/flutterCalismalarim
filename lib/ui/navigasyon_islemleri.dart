import 'package:flutter/material.dart';

class NavigasyonIslemleri extends StatelessWidget {
  String baslik = "B Sayfasııı";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ASayfasi(),
                    ),
                  );
                },
                child: Text("A sayfasına git"),
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BSayfasi(baslik);
                      },
                    ),
                  );
                },
                child: Text("B Sayfasına git"),
                color: Colors.red,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CSayfasi(),
                    ),
                  );
                },
                child: Text("C sayfasına git ve Gelirken  Veri Getir"),
                color: Colors.orange,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DSayfasi(),
                    ),
                  ).then((popOlayindanSonraGelenDeger) {
                    debugPrint(
                        "Pop işleminden gelen değer $popOlayindanSonraGelenDeger");
                  });
                },
                child: Text("D sayfasına git ve Veriyle Gel"),
                color: Colors.pink,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ESayfasi(),
                    ),
                  );
                },
                child: Text("E sayfasına git ve Geri Geleme"),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/listeSayfasi");
                },
                child: Text("Liste sayfasına git"),
                color: Colors.cyan,
              ),   RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/textFieldIslemleri");
                },
                child: Text("Form sayfasına git"),
                color: Colors.yellow,
              ),RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/textFormField");
                },
                child: Text("Text Form Field sayfasına git"),
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListeSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/detay/$index");
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Liste elemanı $index"),
              ),
            ),
          );
        },
        itemCount: 60,
      ),
    );
  }
}

class ListeDetay extends StatelessWidget {
  int tiklanilanIndex = 0;
  ListeDetay(
      this.tiklanilanIndex); // constructer bir metot burası. parametre olarak gelen indexi buraya aktarmaya yarıyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Detay Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Liste elemanı $tiklanilanIndex tıklanıldı"),
        ),
      ),
    );
  }
}

class GSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "G Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "G SAYFASI",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class FSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "F Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "F SAYFASI",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/GPage');
              },
              child: Text("G Sayfasına Git"),
            )
          ],
        ),
      ),
    );
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "E SAYFASI",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/FPage");
              },
              child: Text("F Sayfasına Git"),
            ),
          ],
        ),
      ),
    );
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "D Sayfası",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "D SAYFASII",
                  style: TextStyle(color: Colors.red, fontSize: 24),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop<bool>(context, true);
                    // true demek ürün silindi
                    // false demek ürün silinemedi veya kullanıcı vaz geçti
                  },
                  color: Colors.purple,
                  child: Text("Geri Dön ve veri gönder"),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          debugPrint("onWillPop çalıştı");
          Navigator.pop(context, false);
          return Future.value(true);
        });
  }
}

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "A SAYFASI",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class BSayfasi extends StatelessWidget {
  String gelenBaslikVerisi;

  /* BSayfasi(String baslik) {
    gelenBaslikVerisi = baslik;
  }
*/

  BSayfasi(this.gelenBaslikVerisi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gelenBaslikVerisi,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              gelenBaslikVerisi,
              style: TextStyle(color: Colors.blue, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C Sayfası",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "C SAYFASI",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.purple,
              child: Text("Geri Dön"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ASayfasi(),
                  ),
                );
              },
              color: Colors.brown,
              child: Text("A Sayfasına Git"),
            )
          ],
        ),
      ),
    );
  }
}
