import 'package:flutter/material.dart';
import 'dart:math'
    as matematik; // bu şu demek ben dart.math i matematik olarak çağıracağım demek

class CollapseToolbarOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // title: Text("Sliver App Bar"),
          backgroundColor: Colors.red,
          expandedHeight: 200, // tamamen açıkken 200pizel yer kaplayacak
          floating: true,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver App Bar"),
            centerTitle: true,
            background: Image.asset(
              "assets/images/1.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
       
        // sabit elemanlarıla bir satırda kaç eleman olacağını söylediğimiz grid
        SliverGrid(
          delegate: SliverChildListDelegate(
            sabitListeElemani(),
          ),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
        // bir satırda kaç eleman olacağını dinamik olarak ürettiğimiz kısım
        SliverGrid(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
              childCount: 17),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
              // bir satırdaki elemanın maksimum genişliğini söylediğimiz grid türü
  SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 8),
        ),

SliverGrid.count(crossAxisCount: 6, children:  
  sabitListeElemani()
 ,),
SliverGrid.extent(maxCrossAxisExtent: 50, children:sabitListeElemani(),),

        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              sabitListeElemani(),
            ),
          ),
        ), SliverPadding(
          padding: EdgeInsets.all(6),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 10),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate(sabitListeElemani()),
            itemExtent: 300),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
              childCount: 6),
          itemExtent: 50,
        ),
      ],
    );
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      child: Text(
        "Dinamik liste elemanı  ${index + 1}",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      color: _rastgeleRenkUret(),
      alignment: Alignment.center,
    );
  }

  List<Widget> sabitListeElemani() {
    return [
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.amber,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.orange,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.cyan,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.purple,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.teal,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.blue,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 7",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.cyan,
        alignment: Alignment.center,
      ),
    ];
  }

    Color _rastgeleRenkUret() {
      return Color.fromARGB(
          matematik.Random().nextInt(255),
          matematik.Random().nextInt(255),
          matematik.Random().nextInt(255),
          matematik.Random().nextInt(255));
    }
}
