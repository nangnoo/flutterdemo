import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

bool testFilters(String testTitle) {
  // include tags --dart-define="include=smoke,regression"
  // exclude tags --dart-define="exclude=smoke,regression"
  const includeTags = String.fromEnvironment("include");
  const excludeTags = String.fromEnvironment("exclude");
  bool skipTest = false;

  if (includeTags != '') {
    List<String> arrTags = includeTags.split(',');
    for (var t in arrTags) {
      if (testTitle.contains('#' + t.trim())) return false;
    }
    return true;
  }

  if (excludeTags != '') {
    List<String> arrTags = excludeTags.split(',');
    for (var t in arrTags) {
      if (testTitle.contains('#' + t.trim())) return true;
    }
    return false;
  }

  return skipTest;
}

void setEnv() async {
  const env = String.fromEnvironment('env', defaultValue: 'sit.env');
  await dotenv.load(fileName: "$env");
}

Future<void> takeScreenshot(tester, binding, {imagePath = ''}) async {
  print('screenshot==========>');
  var screenshotName = imagePath == ''
      ? DateTime.now().millisecondsSinceEpoch.toString()
      : imagePath;

  if (!kIsWeb) {
    await binding.convertFlutterSurfaceToImage();
  }

  await tester.pumpAndSettle();
  await binding.takeScreenshot(screenshotName);
}

Future<void> tapAndEnterText(tester, inputText, txt) async {
  if (Platform.isIOS) await tester.tap(inputText);

  await tester.enterText(inputText, txt);

  if (Platform.isAndroid)
    await tester.testTextInput.receiveAction(TextInputAction.done);
}
