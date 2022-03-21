import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import 'package:flutterdemo/screens/course_list.dart';
import 'package:flutterdemo/screens/history.dart';
import 'package:flutterdemo/widgets/components/common.dart';

import '../utils/constant.dart';
import '../globals.dart' as globals;

// import 'package:cached_network_image/cached_network_image.dart';

class CourseRegisterSuccess extends StatefulWidget {
  const CourseRegisterSuccess({Key key, @required this.courseIndex})
      : super(key: key);
  // static final String path = "lib/src/pages/lists/list2.dart";
  final int courseIndex;

  _CourseRegisterSuccessState createState() => _CourseRegisterSuccessState();
}

class _CourseRegisterSuccessState extends State<CourseRegisterSuccess> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFFB39DDB);
  final primaryText = Color(0xFF4527A0);
  final secondary = Color(0xfff29a94);
  final TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  final List<Map> trainingLists = courseDetailLists();
  final List<Map> joined = globals.joined;

  @override
  Widget build(BuildContext context) {
    // print(globals.joined);
    int isRegistered = joined.indexWhere((f) =>
        f['listIndex'] == trainingLists[widget.courseIndex]['listIndex']);
    if (isRegistered == -1) {
      globals.joined.add(trainingLists[widget.courseIndex]);
    }

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: defaultAppBar2(
        context,
        "Register Success",
        CourseList(),
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
                                    TextSpan(text: 'Thank You'),
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
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: primary,
                          textColor: Colors.white,
                          child: Text(
                            "History",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => History(),
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
}
