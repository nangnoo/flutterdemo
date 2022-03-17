import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/Login2.dart';
import 'package:flutterdemo/screens/Register2.dart';

const Color primary = Color(0xFF4527A0);
const TextStyle whiteBoldText = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const TextStyle whiteText = TextStyle(
  color: Colors.white,
);
const TextStyle primaryText = TextStyle(
  color: primary,
);

class Home2 extends StatelessWidget {
  // static final String path = "lib/src/pages/invitation/inlanding.dart";
  Widget appLogo() {
    return Container(
      width: 180,
      child: Image.asset('assets/icon/icon.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: kToolbarHeight),
          Text(
            "Welcome....",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Flutter "),
              TextSpan(text: "Demo", style: primaryText),
            ]),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(60.0)),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Center(
                    child: appLogo(),
                  )),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: RaisedButton(
                      highlightElevation: 0,
                      elevation: 0,
                      child: Text("Create an Account"),
                      textColor: Colors.deepPurple[800],
                      color: Colors.white,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register2(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: OutlineButton(
                        highlightElevation: 0,
                        borderSide: BorderSide(color: Colors.white),
                        child: Text("Sign in"),
                        textColor: Colors.white,
                        color: Colors.white,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login2()))),
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
