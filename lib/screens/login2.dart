import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/course_list.dart';

import '../widgets/components/common.dart';
import '../globals.dart' as globals;
// import 'home2.dart';

const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool signupForm;
  final primary = Color(0xFFB39DDB);

  @override
  void initState() {
    super.initState();
    signupForm = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      // appBar: PreferredSize(
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              color: Colors.deepPurple[200],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.topCenter,
                  height: (MediaQuery.of(context).size.height / 2) - 150,
                  child: Container(
                    width: 150,
                    child: Image.asset('assets/icon/icon.png'),
                  ),
                ),
                const SizedBox(height: 1.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple[200],
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        child: SignIn(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final unameController = TextEditingController();
    final passController = TextEditingController();
    String uname = "qa";
    String pass = "112233";

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: unameController,
            key: const Key('username'),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(
                16.0,
              ),
              hintText: "enter your email or phone",
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passController,
            key: const Key('password'),
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "password",
              contentPadding: const EdgeInsets.all(
                16.0,
              ),
              prefixStyle: boldText.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.deepPurple[800]),
                  primary: Colors.deepPurple[800],
                ),
                child: Text("Sign in"),
                onPressed: () {
                  if (uname == unameController.text &&
                      pass == passController.text) {
                    globals.emailLogedIn = uname;
                    globals.isLoggedIn = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseList()),
                    );
                  } else {
                    unameController.text = "";
                    passController.text = "";
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          type: AlertDialogType.ERROR,
                          title: "Login Failed",
                          content: "Your user ID or password is incorrect.",
                        );
                      },
                    );
                  }
                }),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
