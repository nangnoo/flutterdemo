import 'package:flutter/material.dart';

Widget stdBtnWithCB(String txt, VoidCallback voidCallback) {
  return ElevatedButton(
    child: Text(txt),
    onPressed: voidCallback,
  );
}

Widget stdBtnPush(BuildContext context, String txt, Widget targetScreen) {
  return ElevatedButton(
    child: Text(txt),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => targetScreen));
    },
  );
}

Widget iconSelectCamera() {
  return Icon(
    Icons.camera_alt,
    color: Colors.indigo.shade800,
    size: 40.0,
  );
}

Widget iconSelectImage() {
  return Icon(
    Icons.image,
    color: Colors.indigo.shade800,
    size: 40.0,
  );
}

Widget iconAddImage() {
  return Icon(
    Icons.add_a_photo,
    color: Colors.indigo.shade800,
    size: 40.0,
  );
}

ThemeData defalutThemeData() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.indigo.shade50,
    // scaffoldBackgroundColor: Colors.indigo.shade100,
    // scaffoldBackgroundColor: Colors.deepPurple.shade100,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.indigo.shade800,
      displayColor: Colors.blue,
    ),
  );
}
