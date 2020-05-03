import 'package:flutter/material.dart';

class ListeKonuAnlatimi extends StatelessWidget {
  // liste için veri kaynağı oluştur

  List<int> listeNumaralari = List.generate(300, (bilgi) => bilgi);
  List<String> listeAltBaslik =
      List.generate(300, (index) => "Liste elemanı alt başlık $index");

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listeNumaralari
            .map(
              (oankiEleman) => Column(
                children: <Widget>[
                  Container(
                    child: Card(
                      color: Colors.teal.shade200,
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.android),
                          radius: 12,
                          foregroundColor: Colors.brown.shade200,
                        ),
                        title: Text("Liste elemanı başlığı $oankiEleman"),
                        subtitle: Text(listeAltBaslik[oankiEleman]),
                        trailing: Icon(Icons.add_circle),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.orange,
                    height: 0,
                    indent: 20,
                  ),
                ],
              ),
            )
            .toList());
  }
}

/* <Widget>[
        
        ),         
      ],
      
      */
