import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/utils/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;

import 'screens/home_screen.dart' as homeScreen;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    print("---->setUpAll");
  });

  setUp(() {
    print("----->setUp");
  });

  tearDown(() {
    print("----->tearDown");
  });

  tearDownAll(() {
    print("----->tearDownAll");
  });

  final btnPlus = find.byKey(Key('btnPlus'));
  final txtCounter = find.byKey(Key('txtCounter'));
  final txtCounter2 = find.byWidgetPredicate(
    (Widget widget) =>
        widget is Text && widget.data == '0' && widget.key == Key('txtCounter'),
    description: 'widget with key txtCounter and has text "0"',
  );

  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/first_test.dart
  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/first_test.dart --dart-define="tags=regression"

  testWidgets("test example 1 #regression #smoke", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '');
    await tester.enterText(find.byKey(Key('txtInput1')), 'hi');
    await tester.enterText(find.byType(TextField), 'hello');

    // verify screen title
    expect(find.text('Flutter Demo Title'), findsOneWidget);
    expect(find.byKey(Key('screenTitle')), findsOneWidget);

    final screenTitle = find.text('Flutter Demo Title');
    expect(screenTitle, findsOneWidget);

    // verify text 0
    expect(find.byKey(Key('txtCounter')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    final txtCountInit = find.text('0');
    expect(txtCountInit, findsOneWidget);

    final txtCountInit2 = find.byWidgetPredicate(
      (Widget widget) =>
          widget is Text &&
          widget.data == '0' &&
          widget.key == Key('txtCounter'),
      description: 'widget with key txtCounter and has text "0"',
    );
    expect(txtCountInit2, findsOneWidget);

    // tap and verify result
    await tester.tap(btnPlus);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
  }, skip: testFilters('test example 1 #regression #smoke'));

  testWidgets(
    "test example 2 #regression",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      // tap 10 times
      for (int i = 0; i < 10; i++) {
        // await tester.tap(btnPlus);
        await homeScreen.clickPlusBtn(tester);
        await tester.pumpAndSettle();
        expect(find.text((i + 1).toString()), findsOneWidget);
      }
    },
    skip: testFilters('test example 2 #regression'),
  );
}
