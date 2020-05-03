import 'package:sms/sms.dart';
import 'package:flutter/material.dart';
import 'dart:math'
    as matematik; // bu şu demek ben dart.math i matematik olarak çağıracağım demek

class SmsDinle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    smsUzerine();
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
       

        // bir satırda kaç eleman olacağını dinamik olarak ürettiğimiz kısım
        SliverGrid(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
              childCount: 17),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
              // bir satırdaki elemanın maksimum genişliğini söylediğimiz grid türü
 

      ],
    );
  }

List<SmsMessage> messages;
  smsUzerine() async {
    SmsQuery query = new SmsQuery();
  messages = await query.getAllSms;
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      child: Text(messages[index].toString(),
        
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      color: _rastgeleRenkUret(),
      alignment: Alignment.center,
    );
  }

  Color _rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }
}
