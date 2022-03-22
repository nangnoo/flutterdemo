import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/utils/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;

// void main(List<String> args) {
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/login_test.dart
  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/login_test.dart --dart-define="tags=regression"

  testWidgets("TECHQA-001 Login fail", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // find element by text
    final btnSignIn = find.text('Sign in');
    // verify item on screen
    expect(btnSignIn, findsOneWidget);

    await tester.tap(btnSignIn);
    await tester.pumpAndSettle();

    // find element by ID
    final inputUsername = find.byKey(Key('inputUsername'));
    await tester.tap(inputUsername);
    await tester.enterText(inputUsername, 'email@eamil.coms');

    // find element by Hint
    final inputPassword = find.bySemanticsLabel('password');
    await tester.tap(inputPassword);
    await tester.enterText(inputPassword, '112233');

    await tester.pumpAndSettle();
    // final btnSignIn2 = find.byKey(Key('btnSignIn'));
    final btnSignIn2 = find.byType(OutlinedButton);
    await tester.tap(btnSignIn2);

    await tester.pumpAndSettle();
    final errorDialog = find.byKey(Key('customDialog'));
    expect(errorDialog, findsOneWidget);

    final dialogTitle = find.byKey(Key('dialogTitle'));
    expect(dialogTitle, findsOneWidget);

    final dialogTitle2 = find.byWidgetPredicate(
      (Widget widget) => widget is Text && widget.data == 'Login Failed',
      description: 'find text widget with text "Login Failed"',
    );
    expect(dialogTitle2, findsOneWidget);

    print("Get Detail =====================>");
    print(dialogTitle2.evaluate().first);

    print("Get Text From Element=====================>");
    var dialogTitleTxt = dialogTitle2.evaluate().single.widget as Text;
    print(dialogTitleTxt.data);
    expect(dialogTitleTxt.data, 'Login Failed');

    await Future.delayed(const Duration(seconds: 2), () {});
  }, skip: testFilters('#regression #smoke'));
}
