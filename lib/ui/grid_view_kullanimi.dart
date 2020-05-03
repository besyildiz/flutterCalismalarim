import 'package:flutter/material.dart';

class GridViewKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.red[100 * ((index + 1) % 8)],
              gradient: new LinearGradient(
                  colors: [Colors.red, Colors.yellow],
                  begin: Alignment.centerRight,
                  end: new Alignment(-1.0, -1.0)),
              image: DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.contain, // fill de var
                  alignment: Alignment.topCenter),
              border: new Border(
                top: new BorderSide(
                  color: Colors.pink,
                  width: 5.0,
                  style: BorderStyle.solid,
                ),
              ),
              //   borderRadius: new BorderRadius.all(
              //   new Radius.circular(20.0),
              // ),
              boxShadow: [
                new BoxShadow(
                  color: Colors.green,
                  offset: new Offset(10.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Merhaba Flutter $index",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          onTap: () => debugPrint("Merhaba Flutter $index tıklanıldı"),
          onDoubleTap: () =>
              debugPrint("Merhaba Flutter $index çift tıklanıldı"),
          onLongPress: () =>
              debugPrint("Merhaba Flutter $index basılı tutuldu"),
          onHorizontalDragStart: (e) =>
              debugPrint("Merhaba Flutter $index soldan sağa tıklanıldı $e"),
          onHorizontalDragEnd: (e) =>
              debugPrint("Merhaba Flutter $index sağdan sola tıklanıldı $e"),
      
        );
      },
    );
  }
}

/*

GridView.count(
      crossAxisCount: 4,
      primary: false,
    //  reverse: true,
    scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 2",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 3",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 4",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
       Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 5",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 6",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
      ],
    )


 */

/*

GridView.extent(
      maxCrossAxisExtent: 200,
      primary: false,
    //  reverse: true,
    scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 2",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 3",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 4",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
       Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 5",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),Container(
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba Flutter 6",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
      ],
    )

 */
