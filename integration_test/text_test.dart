import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/utils/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;

// void main(List<String> args) {
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final btnGoToSample = find.byKey(Key('btnGoToSample'));
  final btnPlus = find.byKey(Key('btnPlus'));
  final txtCounter = find.byKey(Key('txtCounter'));
  final txtCounter2 = find.byWidgetPredicate(
    (Widget widget) =>
        widget is Text && widget.data == '0' && widget.key == Key('txtCounter'),
    description: 'widget with key txtCounter and has text "0"',
  );

  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/sample_test.dart
  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/sample_test.dart --dart-define="tags=regression"

  testWidgets("test example 1", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.tap(find.text('Create an Account'));
    await tester.pumpAndSettle();
    final elementFinder = find.bySemanticsLabel('enter your email or phone');

    await tester.tap(elementFinder);
    await tester.enterText(elementFinder, 'email@eamil.coms');

    // await tester.tap(find.byKey((Key('btnRegister'))));
    // await tester.enterText(
    //     find.byKey((Key('btnRegister'))), 'testtttttttttttt');

    sleep(const Duration(seconds: 2));
    await Future.delayed(const Duration(seconds: 2), () {});
  }, skip: testFilters('#regression #smoke'));

  testWidgets("test example 2", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();
    final elementFinder = find.bySemanticsLabel('enter your email or phone');

    await tester.tap(elementFinder);
    await tester.enterText(elementFinder, 'email@eamil.coms');

    // await tester.tap(find.byKey((Key('btnRegister'))));
    // await tester.enterText(
    //     find.byKey((Key('btnRegister'))), 'testtttttttttttt');

    sleep(const Duration(seconds: 2));
    await Future.delayed(const Duration(seconds: 2), () {});
  }, skip: testFilters('#regression #smoke'));
}
