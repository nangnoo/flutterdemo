import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/widgets/components/common.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  PickedFile imageFile;
  var stringTest;

  Future<void> selectImage(ImageSource imageSource) async {
    try {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: imageSource,
        maxWidth: MediaQuery.of(context).size.width * 0.5,
        // maxHeight: MediaQuery.of(context).size.width * 0.5,
      );
      print('=============================0000000000');

      // ByteData data = await rootBundle.load('assets/images/avatar.png');
      // Uint8List bytes = data.buffer.asUint8List();
      // Directory tempDir = await getTemporaryDirectory();
      // String path = '${tempDir.path}/mockImage.png';
      // File file = await File(path).writeAsBytes(bytes);

      // PickedFile pickedFile2 = new PickedFile('/sdcard/Download/avatar.png');
      // print('theimagepath just below===========>');
      // print(tempDir);
      // print(pickedFile2);
      // print(pickedFile2.path);
      // print(pickedFile);
      print(pickedFile.path.toString());

      setState(() {
        imageFile = pickedFile;
        // stringTest = pickedFile2;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget displayAvatar2() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.5,
      child: imageFile == null
          ? Image.asset('assets/images/avatar3.png', fit: BoxFit.fill)
          : Image.file(File(imageFile.path)),
    );
  }

  Widget displayAvatar() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      // padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Stack(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: imageFile == null
                ? Image.asset('assets/images/avatar3.png').image
                : Image.file(File(imageFile.path)).image,
            radius: 200.0,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: btnAddImage(),
          ),
        ],
      ),
    );
  }

  Widget btnAddImage() {
    return IconButton(
        icon: iconAddImage(),
        onPressed: () {
          selectImage(ImageSource.gallery);
        });
  }

  Widget groupBtnAddImage() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: iconSelectCamera(),
            onPressed: () {
              selectImage(ImageSource.camera);
            }),
        IconButton(
            icon: iconSelectImage(),
            onPressed: () {
              selectImage(ImageSource.gallery);
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (imageFile == null)
                  ? Text('Register Page')
                  // : Image.file(File('/sdcard/Download/avatar.png')),
                  // : Image.file(File('/storage/emulated/0/Download/avatar.png')),
                  : Image.file(File(imageFile.path)),
              displayAvatar(),
              groupBtnAddImage(),
            ],
          ),
        ),
      ),
    );
  }
}
