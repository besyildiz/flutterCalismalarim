import 'package:emre1/ui/custom_scroll_ve_slivers.dart';
import 'package:emre1/ui/etkin_liste_ornek.dart';
import 'package:emre1/ui/form_textformfield_ornek.dart';
import 'package:emre1/ui/input_islemleri.dart';
import 'package:emre1/ui/grid_view_kullanimi.dart';
import 'package:emre1/ui/liste_dersleri.dart';
import 'package:emre1/ui/navigasyon_islemleri.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      title: "Flutter Dersleri",
      debugShowCheckedModeBanner: false,
        initialRoute: "/textFormField",
      routes: {
    '/': (context) => NavigasyonIslemleri(),
    '/textFieldIslemleri':(context)=>TextFieldIslemleri(),
    '/textFormField':(context)=>FormveTextFormField(),
    '/CPage': (context) => CSayfasi(),
    '/DPage': (context) => DSayfasi(),
    // "DPage": (context) => DSayfasi(),
    '/FPage': (context) => FSayfasi(),
    '/GPage': (context) => GSayfasi(),
    "/listeSayfasi": (context) => ListeSayfasi(),
    },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == 'detay') {
          return MaterialPageRoute(
              builder: (context) => ListeDetay(int.parse(pathElemanlari[2])));
        }
      },

      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute(builder: (context) => DSayfasi()),
      theme: ThemeData(
        brightness: Brightness.light, // gece modu benzeri
        primarySwatch: Colors.orange,
      ),
      // home: NavigasyonIslemleri(),
    ),
  );
}
