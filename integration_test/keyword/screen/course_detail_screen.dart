import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/common.dart';

Finder screenTitle(String title) => find.text(title);
final btnRegister = find.text('Register Now');

Future<void> verifyCourseDetailTitle(tester, title) async {
  await tester.pumpAndSettle();
  final screenTitle = find.text(title);
  expect(screenTitle, findsOneWidget);
}

Future<void> clickRegister(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnRegister);
}
