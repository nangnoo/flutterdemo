import 'package:flutter_test/flutter_test.dart';

import '../screen/home_screen.dart' as homeScreen;
import '../screen/login_screen.dart' as loginScreen;
import '../screen/course_list_screen.dart' as listScreen;

Future<void> enterDataAndClickLogin(tester, username, password) async {
  await homeScreen.clickOnSignInBtn(tester);
  await loginScreen.enterUsername(tester, username);
  await loginScreen.enterPassword(tester, password);
  await loginScreen.clickSingIn(tester);
  // await listScreen.verifyIsCourseListScreen(tester);
}

Future<void> verifyLoginSuccess(tester) async {
  await listScreen.verifyIsCourseListScreen(tester);
}

Future<void> enterDataAndLoginSuccess(tester, username, password) async {
  await enterDataAndClickLogin(tester, username, password);
  await listScreen.verifyIsCourseListScreen(tester);
}

Future<void> verifyDialog(tester, title, description) async {
  await loginScreen.verifyDialogDisplayed(tester);
  await loginScreen.verifyDialogTitle(tester, title);
  await loginScreen.verifyDialogDescription(tester, description);
}
