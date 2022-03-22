import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;
import '../keyword/feature/login.dart' as loginFeature;
import '../utils/common.dart';

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

    // close keyboard for android
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pumpAndSettle();
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

    var btnSignInTxt = btnSignIn.evaluate().single.widget as Text;
    print(btnSignInTxt.data);
  }, skip: testFilters('#regression #smoke'));

  testWidgets("TECHQA-002 Login success", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final btnSignIn = find.text('Sign in');
    expect(btnSignIn, findsOneWidget);
    await tester.tap(btnSignIn);
    await tester.pumpAndSettle();

    // find element by ID
    final inputUsername = find.byKey(Key('inputUsername'));
    await tester.tap(inputUsername);
    await tester.enterText(inputUsername, 'qa');

    // find element by Hint
    final inputPassword = find.bySemanticsLabel('password');
    await tester.tap(inputPassword);
    await tester.enterText(inputPassword, '112233');

    // close keyboard for android
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pumpAndSettle();
    final btnSignIn2 = find.byType(OutlinedButton);
    await tester.tap(btnSignIn2);

    // verify course list
    final screenTitle = find.text('Training Courses');
    await tester.pumpAndSettle();
    expect(screenTitle, findsOneWidget);
  }, skip: testFilters('#regressions'));

  testWidgets("TECHQA-003 Login success V2", (WidgetTester tester) async {
    app.main();
    await loginFeature.enterDataAndClickLogin(tester, 'qa', '112233');
  }, skip: testFilters('#smoke'));
}