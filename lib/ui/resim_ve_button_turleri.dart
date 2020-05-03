import 'package:flutter/material.dart';
void uzunMetot() {
  debugPrint("Uzun metodum");
}

void digerMetodum() {
  debugPrint("Diğer metodum");
}

class ResimveButtonTurleri extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
 
    return  Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                  child: Text("Ekrem GÜLCÜOĞLU"),
                  onPressed: () => debugPrint("Ekrem GÜLCÜOĞLU")),
              RaisedButton(
                child: Text("Tosya"), color: Colors.blue,
                textColor: Colors.pink,
                onPressed: () => debugPrint(
                    "Tosya"), // tek satırlar için lambda kullanabiliyorum
                elevation: 12,
              ),
              RaisedButton(
                child: Text("Ankara"),
                onPressed: () => debugPrint("Ankara"),
                color: Colors.red,
              ),
              RaisedButton(
                child: Text("Fonksiyon çağırıyorum"),
                onPressed: () {
                  uzunMetot();
                },
                color: Colors.green,
              ),
              RaisedButton(
                child: Text("Diğer metodumu çağırıyorum"),
                onPressed: digerMetodum,
                color: Colors.yellow,
              ),
              IconButton(
                  icon: Icon(
                    Icons.add_alert,
                    size: 32,
                  ),
                  onPressed: () {}),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Test",
                  style: TextStyle(fontSize: 24),
                ),
              )
            ],
          ),
    );
  }
  
}