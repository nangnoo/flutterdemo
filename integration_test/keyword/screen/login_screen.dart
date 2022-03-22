import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/common.dart';

final inputUsername = find.byKey(Key('inputUsername'));
final inputPassword = find.bySemanticsLabel('password');
final btnSignIn = find.text('Sign in');
final btnSignIn2 = find.byType(OutlinedButton);
final errorDialog = find.byKey(Key('customDialog'));
final dialogTitle = find.byKey(Key('dialogTitle'));
final dialogTitle2 = find.byWidgetPredicate(
  (Widget widget) => widget is Text && widget.data == 'Login Failed',
  description: 'find text widget with text "Login Failed"',
);
final dialogDescription = find.byKey(Key('dialogDescription'));

Future<void> enterUsernameV1(tester, txt) async {
  await tester.pumpAndSettle();
  await tester.tap(inputUsername);
  await tester.enterText(inputUsername, txt);
  // close keyboard for android
  await tester.testTextInput.receiveAction(TextInputAction.done);
}

Future<void> enterUsername(tester, txt) async {
  await tester.pumpAndSettle();
  await tapAndEnterText(tester, inputUsername, txt);
}

Future<void> enterPasswordV1(tester, txt) async {
  await tester.pumpAndSettle();
  await tester.tap(inputPassword);
  await tester.enterText(inputPassword, txt);
  // close keyboard for android
  await tester.testTextInput.receiveAction(TextInputAction.done);
}

Future<void> enterPassword(tester, txt) async {
  await tester.pumpAndSettle();
  await tapAndEnterText(tester, inputPassword, txt);
}

Future<void> clickSingIn(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnSignIn);
}

Future<void> verifyDialogDisplayed(tester) async {
  await tester.pumpAndSettle();
  expect(errorDialog, findsOneWidget);
}

Future<void> verifyDialogTitle(tester, txt) async {
  await tester.pumpAndSettle();
  expect(dialogTitle2, findsOneWidget);
}

Future<void> verifyDialogTitleV2(tester, txt) async {
  await tester.pumpAndSettle();
  var dialogTitleTxt = dialogTitle2.evaluate().single.widget as Text;
  expect(dialogTitleTxt.data, 'Login Failed');
}

Future<void> verifyDialogDescription(tester, txt) async {
  await tester.pumpAndSettle();
  var dialogDescTxt = dialogDescription.evaluate().single.widget as Text;
  expect(dialogDescTxt.data, 'Your user ID or password is incorrect.');
}
