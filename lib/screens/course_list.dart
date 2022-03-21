import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import '../utils/constant.dart';
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
      appBar: PreferredSize(
        child: Container(
          height: 90,
          padding: const EdgeInsets.only(top: 20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(20.0),
                  // bottomRight: Radius.circular(20.0),
                  )),
          child: ListTile(
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.menu),
              // icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            trailing: TextButton(
              onPressed: () {},
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              "Training Courses",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(90.0),
      ),
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
              /*Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Training Courses",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
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
                  builder: (context) => CourseDetail(courseIndex: index)));
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
}
