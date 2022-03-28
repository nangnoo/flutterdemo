import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final screenTitle = find.text('History');
Finder targetCourse(String courseTitle) => find.text(courseTitle);

Future<void> verifyIsHistoryScreenTitle(tester) async {
  await tester.pumpAndSettle();
  expect(screenTitle, findsOneWidget);
}

Future<void> verifyCourseRegisteredIsDisplay(tester, courseTitle) async {
  await tester.pumpAndSettle();
  expect(targetCourse(courseTitle), findsOneWidget);
}
