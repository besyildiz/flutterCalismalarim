import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  String girilenMetin = "";
  int maxLine = 1;
  FocusNode _fNode;
  TextEditingController textController1;
  TextEditingController textController2;
  int c;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "varsayılan");
    textController2 = TextEditingController(text: "varsayılan");
    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus)
          maxLine = 3;
        else
          maxLine = 1;
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input işlemleri"),
      ),
      floatingActionButton: (Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            child: FloatingActionButton(
              heroTag: "aa",
              onPressed: () {
                int a=int.parse(textController1.text);
                int b=int.parse(textController2.text);
                 c=a+b;
                setState(() {

                  girilenMetin=c.toString();
                  debugPrint(girilenMetin);

                }); },
              child: Icon(
                Icons.ac_unit,
                size: 12,
              ),
              backgroundColor: Colors.greenAccent.shade200,
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "bb",
            onPressed: () {
              textController1.text = "Selam";
              // debugPrint()
            },
            child: Icon(
              Icons.ac_unit,
            ),
            mini: true,
            backgroundColor: Colors.pink.shade300,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "cc",
            onPressed: () {
              debugPrint(
                  textController1.text.toString()); // _fNode.requestFocus();
            },
            child: Icon(Icons.edit),
          ),
        ],
      )),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: false,
              focusNode: FocusNode(),
              maxLines: maxLine,
              controller: textController1,
              decoration: InputDecoration(
                hintText: "Metni buraya yazınız",
                labelText: "Başlık",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
                fillColor: Colors.red.shade50,
                filled: true,
              ),
              maxLengthEnforced: true,
              onChanged: (String s) {
                debugPrint("On change: $s");
                girilenMetin = s;
              },
              onSubmitted: (String s) => debugPrint("On submit: $s"),
              cursorColor: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: false,
              maxLines: 1,
              maxLength: 20,
              controller: textController2,
              decoration: InputDecoration(
                hintText: "Metni buraya yazınız",
                labelText: "Başlık",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
                fillColor: Colors.red.shade50,
                filled: true,
              ),
              maxLengthEnforced: true,
              onChanged: (String s) {
                debugPrint("On change: $s");
                girilenMetin = s;
              },
              onSubmitted: (String s) => debugPrint("On submit: $s"),
              cursorColor: Colors.amber,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            // height: MediaQuery.of(context).size.height/2,
            height: 200,
            child: Align(
              alignment: Alignment.center,
              child: Text(c.toString()),
            ),
            color: Colors.teal.shade400,
          ),
        ],
      ),
    );
  }
}
