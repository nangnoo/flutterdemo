import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/common.dart';

final btnBack = find.byIcon(Icons.arrow_back_ios);
final btnHistory = find.text('History');
final txtSuccess = find.text('Registration Success');

Future<void> verifySuccessScreen(tester) async {
  await tester.pumpAndSettle();
  expect(txtSuccess, findsOneWidget);
}

Future<void> clickBack(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnBack);
}

Future<void> clickHistoryButton(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnHistory);
}
