import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/login.dart';
import 'package:flutterdemo/screens/register.dart';
import 'package:flutterdemo/screens/sample.dart';
import 'package:flutterdemo/widgets/components/common.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Widget appLogo() {
  return Container(
    width: 180,
    child: Image.asset('assets/icon/icon.png'),
  );
}

Widget appTitle() {
  return Text(
    'Flutter Demo',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget btnSignIn(BuildContext context) {
  return stdBtnWithCB('SignIn', () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  });
}

Widget btnSignUp(BuildContext context) {
  return stdBtnPush(context, 'SignUp', Register());
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              appLogo(),
              SizedBox(height: 20),
              appTitle(),
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                key: const ValueKey('btnGoToSample'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: 'Flutter Demo Title')));
                },
                child: SizedBox(
                  height: 20,
                  width: 20,
                  // child: const Card(child: Text('H')),
                ),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    btnSignIn(context),
                    SizedBox(width: 10),
                    btnSignUp(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
