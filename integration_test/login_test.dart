import 'dart:io';

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

  testWidgets("QATECH-001 Login fail", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // find element by text
    final btnSignIn = find.text('Sign in');
    await tester.tap(btnSignIn);
    await tester.pumpAndSettle();

    // find element by ID
    final inputUsername = find.bySemanticsLabel('enter your email or phone');
    await tester.tap(inputUsername);
    await tester.enterText(inputUsername, 'email@eamil.coms');

    // find element by Hint
    final inputPassword = find.bySemanticsLabel('password');
    await tester.tap(inputPassword);
    await tester.enterText(inputPassword, '112233');

    await Future.delayed(const Duration(seconds: 2), () {});
  }, skip: testFilters('#regression #smoke'));
}
