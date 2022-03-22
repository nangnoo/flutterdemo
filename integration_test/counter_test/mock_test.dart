import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;
// import 'package:flutterdemo/logger_stack_trace.dart' as loggerStackTrace;
import 'package:flutterdemo/logger_stack_trace.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const tags = String.fromEnvironment("tags");
  print('Custom arg ==================> ' + tags);

  final btnSignIn = find.text('SignIn');
  final btnSignUp = find.text('SignUp');
  final btnSelectImage = find.widgetWithIcon(IconButton, Icons.add_a_photo);

  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/image_picker');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    print('======> Start Mock Image <======');
    ByteData data = await rootBundle.load('assets/images/avatar.png');
    Uint8List bytes = data.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();
    String path = '${tempDir.path}/mockImage11.png';
    File file = await File(path).writeAsBytes(bytes);
    print('=>>>>>>>>>>>>>>>>>>>>' + file.path);
    // PickedFile pickedFile2 = new PickedFile(path);
    // PickedFile pickedFile2 = new PickedFile('/sdcard/Download/avatar.png');
    return file.path;
  });

  testWidgets("test example 6", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(btnSignUp, findsOneWidget);
    await tester.tap(btnSignUp);
    await tester.pumpAndSettle();
    expect(btnSelectImage, findsOneWidget);
    await tester.tap(btnSelectImage);
    await tester.pumpAndSettle();
    await tester.tap(btnSelectImage);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5), () {});
  }, skip: false);

  // testWidgets("test example 1", (WidgetTester tester) async {
  //   // print('--------------------->' + StackTrace.current.toString());
  //   app.main();
  //   await tester.pumpAndSettle();
  //   expect(btnSignIn, findsOneWidget);
  //   await tester.tap(btnSignIn);
  //   await tester.pumpAndSettle();
  //   expect(find.text('Login Page'), findsOneWidget);
  // });

  // testWidgets("test example 2 #smoke", (WidgetTester tester) async {
  //   // print('--------------------->' + StackTrace.current.toString());
  //   app.main();
  //   await tester.pumpAndSettle();
  //   expect(btnSignUp, findsOneWidget);
  //   await tester.tap(btnSignUp);
  //   await tester.pumpAndSettle();
  //   expect(find.text('Register Page'), findsOneWidget);
  // }, skip: testFilter());
}
