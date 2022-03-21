import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import 'package:flutterdemo/screens/course_list.dart';
import 'package:flutterdemo/screens/course_regis_success.dart';
import 'package:flutterdemo/widgets/components/common.dart';

import '../utils/constant.dart';
import '../globals.dart' as globals;

// import 'package:cached_network_image/cached_network_image.dart';

class CourseRegister extends StatefulWidget {
  const CourseRegister({Key key, @required this.courseIndex}) : super(key: key);
  // static final String path = "lib/src/pages/lists/list2.dart";
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

  @override
  Widget build(BuildContext context) {
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
                                // const SizedBox(height: 10.0),
                                // Text.rich(
                                //   TextSpan(children: [
                                //     WidgetSpan(
                                //         child: Icon(
                                //       Icons.person_rounded,
                                //       size: 16.0,
                                //       color: primaryText,
                                //     )),
                                //     TextSpan(
                                //         text: trainingLists[widget.courseIndex]
                                //             ['trainer']),
                                //   ]),
                                //   style: TextStyle(
                                //       color: primaryText, fontSize: 12.0),
                                // )
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
                      buildTextField('Employee ID', 'enter your id',
                          id: 'inputID'),
                      buildTextField('Full Name', 'enter your full name',
                          id: 'inputName'),
                      buildTextField('Email', 'enter your email',
                          id: 'inputEmail'),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: primary,
                          textColor: Colors.white,
                          child: Text(
                            "Register Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseRegisterSuccess(
                                  courseIndex: widget.courseIndex),
                            ),
                          ),
                        ),
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

  Widget buildTextField(title, hint, {id: ''}) {
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
