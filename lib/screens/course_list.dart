import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import 'package:flutterdemo/screens/history.dart';
import 'package:flutterdemo/screens/login2.dart';
import '../utils/constant.dart';
import '../widgets/components/common.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class CourseList extends StatefulWidget {
  CourseList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFFB39DDB);
  final primaryText = Color(0xFF4527A0);
  // final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  final List<Map> trainingLists = courseDetailLists();
  // final Map<String, dynamic> trainingLists2 = courseDetailLists2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      drawer: menu(),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: trainingLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    // dynamic trainingLists = trainingLists2[index];
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetail(courseIndex: index),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 25, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: secondary),
                  image: DecorationImage(
                      image: NetworkImage(trainingLists[index]['logoText']),
                      // image: NetworkImage(trainingLists2[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      trainingLists[index]['name'],
                      style: TextStyle(
                          color: primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today_rounded,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(trainingLists[index]['date'],
                            style: TextStyle(
                                color: primaryText,
                                fontSize: 12,
                                letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person_rounded,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(trainingLists[index]['trainer'],
                            style: TextStyle(
                                color: primaryText,
                                fontSize: 12,
                                letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Training Courses",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget menu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: primary,
            //height: deviceSize.height * 0.3,
            padding: EdgeInsets.only(bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avatar2.png'),
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(
                          color: primaryText,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'QATechx'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.receipt,
              color: primaryText,
            ),
            title: const Text('History'),
            // onTap: () {},
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => History(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: primaryText,
            ),
            title: const Text('Logout'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login2(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
