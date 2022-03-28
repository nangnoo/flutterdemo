import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/common.dart';

final inputID = find.byKey(Key('inputID'));
final inputName = find.byKey(Key('inputName'));
final inputEmail = find.byKey(Key('inputEmail'));
final btnRegister = find.text('Register Now');

Future<void> enterEmpID(tester, txt) async {
  await tester.pumpAndSettle();
  await tapAndEnterText(tester, inputID, txt);
}

Future<void> enterEmpName(tester, txt) async {
  await tester.pumpAndSettle();
  await tapAndEnterText(tester, inputName, txt);
}

Future<void> enterEmpEmail(tester, txt) async {
  await tester.pumpAndSettle();
  await tapAndEnterText(tester, inputEmail, txt);
}

Future<void> clickRegister(tester) async {
  await tester.pumpAndSettle();
  await tester.tap(btnRegister);
}
