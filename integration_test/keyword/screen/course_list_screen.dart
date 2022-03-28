import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final btnMenuBar = find.byIcon(Icons.menu);
Finder menuName(String subMenuTitle) => find.text(subMenuTitle);
final screenTitle = find.text('Training Courses');
Finder targetCourse(String courseTitle) => find.text(courseTitle);

Future<void> verifyIsCourseListScreen(tester) async {
  await tester.pumpAndSettle();
  expect(screenTitle, findsOneWidget);
}

Future<void> clickTargetCourse(tester, title) async {
  await tester.pumpAndSettle();
  expect(targetCourse(title), findsOneWidget);
  await tester.tap(targetCourse(title));
}

Future<void> clickMenuBtn(tester) async {
  await tester.pumpAndSettle();
  expect(screenTitle, findsOneWidget);
  await tester.tap(btnMenuBar);
}

Future<void> clickSubMenu(tester, subMenuTitle) async {
  await tester.pumpAndSettle();
  await tester.tap(menuName(subMenuTitle));
}
