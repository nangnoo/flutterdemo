import 'package:flutter_test/flutter_test.dart';

final btnSignIn = find.text('Sign in');

Future<void> clickOnSignInBtn(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnSignIn);
}
