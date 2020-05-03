import 'package:emre1/ui/resim_ve_button_turleri.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
 
    return  ( MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            "Ekrem2",
            style: TextStyle(color: Colors.red, fontSize: 36),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint(
              "FAB A tıklandı",
            );
          },
          //  backgroundColor: Colors.red,
          child: new Icon(Icons.access_alarms, color: Colors.blue, size: 48.0),
        ),
        body:ResimveButtonTurleri()
      
      
     ),));
  }
 
}