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

  testWidgets("test example 1 #regression #smoke", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(btnGoToSample);
    await tester.pumpAndSettle();
    expect(txtCounter2, findsOneWidget);
    await tester.tap(btnPlus);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
    // runApp(MyApp());
  }, skip: testFilters('test example 1 #regression #smoke'));

  testWidgets(
    "test example 2 #regression",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(btnGoToSample);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);
    },
    skip: testFilters('test example 2 #regression'),
  );

  testWidgets(
    "test example 3 #regression",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(btnGoToSample);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      expect(find.text('22'), findsOneWidget);
    },
    skip: testFilters('test example 3 #regression'),
  );

  testWidgets(
    "test example 4 #regression",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(btnGoToSample);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      await tester.tap(btnPlus);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);
    },
    skip: testFilters('test example 4 #regression'),
  );
}
