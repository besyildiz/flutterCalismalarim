import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        /*textTheme: TextTheme(
display2: TextStyle(fontSize: 12),
        ) ,*/
        primarySwatch: Colors.blue,
      ),
      title: "MaterialApp title",
      home: MyHomePage(title: "Sayaç Çalışmam"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  int sayac = 0;
  MyHomePage({this.title}) {
    debugPrint("MyHomePage statefull widget consturcter");
  }

  @override
  State<StatefulWidget> createState() {
    debugPrint("MyHomePage createState tetiklendi");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageState() {
    debugPrint("MyHomePageState constructer tetiklendir");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("MyHomePageState build metodu tetiklendi");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _sayacDEgeriniArttir();
            debugPrint(
                "sayaç değeri arttırıldı, setSTate çağrıldı constructer tetiklendir");
          });
        },
        child: Icon(Icons.add_circle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Arttır"),
              color: Colors.green,
              onPressed: _sayacDEgeriniArttir,
            ),
            Text("${widget.sayac}",
                style: Theme.of(context).textTheme.display2.copyWith(
                  color:widget.sayac<=0? Colors.red : Colors.green
                ),
                
                ),
            RaisedButton(
              child: Text("Azalt"),
              color: Colors.red,
              onPressed: _sayacDegeriniAzalt,
            ),
          ],
        ),
      ),
    );
  }

  void _sayacDEgeriniArttir() {
    setState(() {
      
    widget.sayac++;
    debugPrint("Sayaç değeri: ${widget.sayac}");
 
    }); }

  void _sayacDegeriniAzalt() {
 setState(() {
    widget.sayac--;
    debugPrint("Sayaç değeri: " + widget.sayac.toString());
  
 });
   }
}
