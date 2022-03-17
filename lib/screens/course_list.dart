import 'package:flutter/material.dart';
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
      "name": "Espresso UI Android Test",
      "date": "10/08/2025",
      "trainer": "K. RUKKIJ WANLOPTAREE",
      "logoText": "https://miro.medium.com/max/644/1*l7-D4syz21-0ppmom2BIQQ.png"
    },
    {
      "name": "XCUITest iOS UI Test",
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
          "http://www.thejungleadventure.com/assets/images/noimage/noimage.png"
    },
    {
      "name": "Robot Framework #2",
      "date": "23/08/2025 - 24/08/2025",
      "trainer": "K. SUKPANITADA PUHONGCHAI",
      "logoText":
          "http://www.thejungleadventure.com/assets/images/noimage/noimage.png"
    },
    {
      "name": "Basic JavaScript #Round 1",
      "date": "23/08/2025 - 24/08/2025",
      "trainer": "K. WEERAWAT SEETALALAI",
      "logoText":
          "https://w7.pngwing.com/pngs/1007/564/png-transparent-java-script-logo-javascript-web-development-logo-script-text-computer-programming-internet.png"
    },
    {
      "name": "Basic JavaScript #Round 2",
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 135),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: trainingLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              Container(
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
              ),
              /*Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // child: TextField(
                        //   // controller: TextEditingController(text: locations[0]),
                        //   cursorColor: Theme.of(context).primaryColor,
                        //   style: dropdownMenuItem,
                        //   decoration: InputDecoration(
                        //       hintText: "Choose",
                        //       hintStyle: TextStyle(
                        //           color: Colors.black38, fontSize: 16),
                        //       prefixIcon: Material(
                        //         elevation: 0.0,
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(30)),
                        //         child: Icon(Icons.search),
                        //       ),
                        //       border: InputBorder.none,
                        //       contentPadding: EdgeInsets.symmetric(
                        //           horizontal: 25, vertical: 13)),
                        // ),
                        // child: Text("Sign in"),
                        // child: titleSection(context, 'Choose your course'),
                      ),
                    ),
                  ],
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
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
            width: 80,
            height: 80,
            margin: EdgeInsets.only(right: 15),
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
                  height: 15,
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
                            fontSize: 13,
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
                            fontSize: 13,
                            letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget titleSection(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 35,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
