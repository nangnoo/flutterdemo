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
      height: 100,
      padding: const EdgeInsets.only(top: 40.0),
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

enum AlertDialogType {
  SUCCESS,
  ERROR,
  WARNING,
  INFO,
}

class CustomAlertDialog extends StatelessWidget {
  final AlertDialogType type;
  final String title;
  final String content;
  final Widget icon;
  final String buttonLabel;
  final TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  CustomAlertDialog(
      {Key key,
      this.title = "Successful",
      this.content,
      this.icon,
      this.type = AlertDialogType.INFO,
      this.buttonLabel = "Ok"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        key: const Key('customDialog'),
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10.0),
                icon ??
                    Icon(
                      _getIconForType(type),
                      color: _getColorForType(type),
                      size: 50,
                    ),
                const SizedBox(height: 10.0),
                Text(
                  title,
                  style: titleStyle,
                  textAlign: TextAlign.center,
                  key: const Key('dialogTitle'),
                ),
                Divider(),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  key: const Key('dialogDescription'),
                ),
                SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(buttonLabel),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  IconData _getIconForType(AlertDialogType type) {
    switch (type) {
      case AlertDialogType.WARNING:
        return Icons.warning;
      case AlertDialogType.SUCCESS:
        return Icons.check_circle;
      case AlertDialogType.ERROR:
        return Icons.error;
      case AlertDialogType.INFO:
      default:
        return Icons.info_outline;
    }
  }

  Color _getColorForType(AlertDialogType type) {
    switch (type) {
      case AlertDialogType.WARNING:
        return Colors.orange;
      case AlertDialogType.SUCCESS:
        return Colors.green;
      case AlertDialogType.ERROR:
        return Colors.red;
      case AlertDialogType.INFO:
      default:
        return Colors.blue;
    }
  }
}
