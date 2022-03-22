import 'package:flutter_test/flutter_test.dart';

final screenTitle = find.text('Training Courses');

Future<void> verifyIsCourseListScreen(tester) async {
  await tester.pumpAndSettle();
  expect(screenTitle, findsOneWidget);
}
