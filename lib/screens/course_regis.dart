import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import 'package:flutterdemo/screens/course_list.dart';
import 'package:flutterdemo/screens/course_regis_success.dart';
import 'package:flutterdemo/widgets/components/common.dart';

import '../utils/constant.dart';
import '../globals.dart' as globals;

class CourseRegister extends StatefulWidget {
  const CourseRegister({Key key, @required this.courseIndex}) : super(key: key);
  final int courseIndex;

  _CourseRegisterState createState() => _CourseRegisterState();
}

class _CourseRegisterState extends State<CourseRegister> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFFB39DDB);
  final primaryText = Color(0xFF4527A0);
  final secondary = Color(0xfff29a94);
  final TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  final List<Map> trainingLists = courseDetailLists();

  String _selectedGender = 'macos';

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: defaultAppBar2(
        context,
        "Course Register",
        // trainingLists[widget.courseIndex]['name'],
        CourseDetail(
          courseIndex: widget.courseIndex,
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            // padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        trainingLists[widget.courseIndex]['name'],
                        style: TextStyle(
                            color: primaryText,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.calendar_today_rounded,
                                      size: 18.0,
                                      color: primaryText,
                                    )),
                                    TextSpan(
                                        text: trainingLists[widget.courseIndex]
                                            ['date']),
                                  ]),
                                  style: TextStyle(
                                      color: primaryText, fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              // const SizedBox(height: 25.0),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      buildTextField(
                          idController, 'Employee ID', 'enter your id',
                          id: 'inputID'),
                      buildTextField(
                          nameController, 'Full Name', 'enter your full name',
                          id: 'inputName'),
                      buildTextField(
                          emailController, 'Email', 'enter your email',
                          id: 'inputEmail'),
                      const SizedBox(height: 10.0),
                      Text('Laptop type'),
                      SizedBox(height: 3.0),
                      // ListTile(
                      //   leading: Radio<String>(
                      //     value: 'other',
                      //     groupValue: _selectedGender,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _selectedGender = value;
                      //       });
                      //     },
                      //   ),
                      //   title: const Text('Male'),
                      // ),
                      Row(
                        children: <Widget>[
                          Radio(
                            groupValue: _selectedGender,
                            value: "macos",
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text("Mac OS"),
                          Radio(
                            groupValue: _selectedGender,
                            value: "windows",
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text("Windows"),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primary,
                              onPrimary: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "Register Now",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onPressed: () {
                              print(_selectedGender);

                              if (idController.text != '' &&
                                  nameController.text != '' &&
                                  emailController.text != '') {
                                // globals.emailLogedIn = uname;
                                // globals.isLoggedIn = true;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseRegisterSuccess(
                                        courseIndex: widget.courseIndex),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      type: AlertDialogType.ERROR,
                                      title: "Register Failed",
                                      content:
                                          "Please fill out all required fields",
                                    );
                                  },
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(controllor, title, hint, {id: ''}) {
    const TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold,
    );
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title),
            SizedBox(height: 3.0),
            TextField(
              controller: controllor,
              key: (Key(id)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(
                  16.0,
                ),
                hintText: hint,
                prefixStyle: boldText.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(height: 15.0),
          ]),
    );
  }
}
