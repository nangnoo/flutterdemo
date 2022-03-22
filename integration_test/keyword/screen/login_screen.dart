import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final inputUsername = find.byKey(Key('inputUsername'));
final inputPassword = find.bySemanticsLabel('password');
final btnSignIn = find.text('Sign in');
final btnSignIn2 = find.byType(OutlinedButton);

Future<void> enterUsername(tester, txt) async {
  await tester.pumpAndSettle();
  await tester.tap(inputUsername);
  await tester.enterText(inputUsername, txt);
  // close keyboard for android
  await tester.testTextInput.receiveAction(TextInputAction.done);
}

Future<void> enterPassword(tester, txt) async {
  await tester.pumpAndSettle();
  await tester.tap(inputPassword);
  await tester.enterText(inputPassword, txt);
  // close keyboard for android
  await tester.testTextInput.receiveAction(TextInputAction.done);
}

Future<void> clickSingIn(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnSignIn);
}
