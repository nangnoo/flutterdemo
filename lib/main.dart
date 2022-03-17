import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/screens/home2.dart';
import 'package:flutterdemo/screens/Login2.dart';
import 'package:flutterdemo/widgets/components/common.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Title',
      theme: defalutThemeData(),
      // home: MyHomePage(title: 'Flutter Demo Title'),
      // home: Home(),
      // home: Login2(),
      home: Home2(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          key: const ValueKey('screenTitle'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              key: const ValueKey('txtInput1'),
              // cursorColor: Theme.of(context).cursorColor,
              initialValue: 'Default text',
              // maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(Icons.favorite),
                labelText: 'Label text',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),
                // helperText: 'Helper text',
                // suffixIcon: Icon(
                //   Icons.check_circle,
                // ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6200EE)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Text(
              'You have pushed the button this many times:',
              key: const ValueKey('title'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              key: ValueKey('txtCounter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('btnPlus'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
