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
    int isRegistered = joined.indexWhere((f) =>
        f['listIndex'] == trainingLists[widget.courseIndex]['listIndex']);
    if (isRegistered == -1) {
      globals.joined.add(trainingLists[widget.courseIndex]);
    }

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: defaultAppBar2(
        context,
        trainingLists[widget.courseIndex]['name'],
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
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.done,
                          color: Color.fromARGB(131, 6, 184, 101),
                          size: 80,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(text: 'Registration Success'),
                          ]),
                          style: TextStyle(color: primaryText, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(height: 50.0),
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
                            "History",
                            style: TextStyle(fontWeight: FontWeight.normal),
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
