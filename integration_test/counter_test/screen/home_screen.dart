import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final btnPlus = find.byKey(Key('btnPlus'));

Future<void> clickPlusBtn(tester) async {
  await tester.tap(btnPlus);
}
