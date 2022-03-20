import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/components/common.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'home2.dart';

const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  bool signupForm;
  PickedFile imageFile;
  var stringTest;

  @override
  void initState() {
    super.initState();
    signupForm = true;
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

  Future<void> selectImage(ImageSource imageSource) async {
    try {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: imageSource,
        maxWidth: MediaQuery.of(context).size.width * 0.5,
        // maxHeight: MediaQuery.of(context).size.width * 0.5,
      );
      print('=============================0000000000');

      print(pickedFile.path.toString());

      setState(() {
        imageFile = pickedFile;
        // stringTest = pickedFile2;
      });
    } catch (e) {
      print(e);
    }
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
      appBar: defaultAppBar(),
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              color: Colors.deepPurple[200],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                const SizedBox(height: 20.0),
                displayAvatar(),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple[200],
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        child: SignUp(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Semantics(
          explicitChildNodes: true,
          child: Column(
            children: <Widget>[
              TextField(
                key: const ValueKey('btnRegister'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(
                    16.0,
                  ),
                  hintText: "enter your email or phone",
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                  contentPadding: const EdgeInsets.all(
                    16.0,
                  ),
                  prefixStyle: boldText.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "confirm password",
                  contentPadding: const EdgeInsets.all(
                    16.0,
                  ),
                  prefixStyle: boldText.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: RaisedButton(
                  highlightElevation: 0,
                  elevation: 0,
                  child: Text("Sign Up"),
                  textColor: Colors.white,
                  color: Colors.deepPurple[800],
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register2(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ));
  }
}
