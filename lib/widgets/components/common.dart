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

Widget defaultAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.deepPurple[200],
    elevation: 0,
  );
}

Widget defaultAppBar2(BuildContext context, String title, Widget targetScreen) {
  return PreferredSize(
    child: Container(
      height: 90,
      padding: const EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(20.0),
              // bottomRight: Radius.circular(20.0),
              )),
      child: ListTile(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          ),
        ),
        // trailing: TextButton(
        //   onPressed: () {},
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.favorite_border,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(90.0),
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
