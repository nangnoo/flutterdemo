import '../screen/home_screen.dart' as homeScreen;
import '../screen/login_screen.dart' as loginScreen;
import '../screen/course_list_screen.dart' as listScreen;

Future<void> enterDataAndClickLogin(tester, username, password) async {
  await homeScreen.clickOnSignInBtn(tester);
  await loginScreen.enterUsername(tester, username);
  await loginScreen.enterPassword(tester, password);
  await loginScreen.clickSingIn(tester);
  await listScreen.verifyIsCourseListScreen(tester);
}
