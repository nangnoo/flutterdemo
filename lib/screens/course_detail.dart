import 'package:flutter/material.dart';

// import 'package:cached_network_image/cached_network_image.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key key, @required this.courseIndex}) : super(key: key);
  // static final String path = "lib/src/pages/lists/list2.dart";
  final int courseIndex;

  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xFFB39DDB);
  final primaryText = Color(0xFF4527A0);
  final secondary = Color(0xfff29a94);
  final TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
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
      "logoText":
          "https://www.pikpng.com/pngl/m/52-521739_espresso-android-png-clipart.png"
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

  // get courseIndex => this.courseIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      // appBar: PreferredSize(
      //   child: Container(
      //     height: 90,
      //     padding: const EdgeInsets.only(top: 20.0),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //         color: primary,
      //         borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(20.0),
      //           bottomRight: Radius.circular(20.0),
      //         )),
      //     child: ListTile(
      //       leading: IconButton(
      //         color: Colors.white,
      //         icon: Icon(Icons.arrow_back_ios),
      //         onPressed: () {},
      //       ),
      //       trailing: TextButton(
      //         onPressed: () {},
      //         child: IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.favorite_border,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //       title: Text(
      //         trainingLists[widget.courseIndex]['name'],
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 22.0),
      //       ),
      //     ),
      //   ),
      //   preferredSize: Size.fromHeight(90.0),
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            child: Image.network(trainingLists[widget.courseIndex]['logoText'],
                fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    trainingLists[widget.courseIndex]['name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
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
                                      size: 16.0,
                                      color: primaryText,
                                    )),
                                    TextSpan(
                                        text: trainingLists[widget.courseIndex]
                                            ['date']),
                                  ]),
                                  style: TextStyle(
                                      color: primaryText, fontSize: 12.0),
                                ),
                                const SizedBox(height: 10.0),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.person_rounded,
                                      size: 16.0,
                                      color: primaryText,
                                    )),
                                    TextSpan(
                                        text: trainingLists[widget.courseIndex]
                                            ['trainer']),
                                  ]),
                                  style: TextStyle(
                                      color: primaryText, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              // const SizedBox(height: 25.0),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: primary,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primary,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primary,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primary,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: primary,
                                  ),
                                ],
                              ),
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
                            "Register Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
