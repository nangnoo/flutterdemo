import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_detail.dart';
import 'package:flutterdemo/screens/course_list.dart';

import '../widgets/components/common.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFFB39DDB);
  final primaryText = Color(0xFF4527A0);
  // final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> trainingLists = [
    {
      "name": "Basic Unix",
      "date": "12/05/2025",
      "trainer": "K. SHATCHAI JITWATTANA",
      "logoText":
          "http://www.thejungleadventure.com/assets/images/noimage/noimage.png"
    },
    {
      "name": "Cypress 101",
      "date": "18/06/2025 - 19/06/2025",
      "trainer": "K. Kanittha Harnrattanaprasert",
      "logoText":
          "https://icons-for-free.com/iconfiles/png/512/cypress-1324440144114984250.png"
    },
    {
      "name": "Espresso UI Test",
      "date": "10/08/2025",
      "trainer": "K. RUKKIJ WANLOPTAREE",
      "logoText":
          "https://www.pikpng.com/pngl/m/52-521739_espresso-android-png-clipart.png"
    },
    {
      "name": "XCUITest",
      "date": "15/08/2025",
      "trainer": "K. NAPATR TANSUTIRAPHONG",
      "logoText":
          "https://images.ctfassets.net/czwjnyf8a9ri/2OWZnl3v2xJcqBZPIczU1s/1ea9ea383887e13d76b0b6c386ddf09c/logo-xcuitest.png"
    },
    {
      "name": "Robot Framework #1",
      "date": "21/08/2025 - 22/08/2025",
      "trainer": "K. SUKPANITADA PUHONGCHAI",
      "logoText":
          "https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png"
    },
    {
      "name": "Robot Framework #2",
      "date": "23/08/2025 - 24/08/2025",
      "trainer": "K. SUKPANITADA PUHONGCHAI",
      "logoText":
          "https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png"
    },
    {
      "name": "Basic JavaScript #1",
      "date": "23/08/2025 - 24/08/2025",
      "trainer": "K. WEERAWAT SEETALALAI",
      "logoText":
          "https://w7.pngwing.com/pngs/1007/564/png-transparent-java-script-logo-javascript-web-development-logo-script-text-computer-programming-internet.png"
    },
    {
      "name": "Basic JavaScript #2",
      "date": "10/09/2025 - 11/09/2025",
      "trainer": "K. WEERAWAT SEETALALAI",
      "logoText":
          "https://w7.pngwing.com/pngs/1007/564/png-transparent-java-script-logo-javascript-web-development-logo-script-text-computer-programming-internet.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: defaultAppBar2(
        context,
        "History",
        CourseList(),
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
