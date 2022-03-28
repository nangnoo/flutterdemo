import 'package:flutter_test/flutter_test.dart';

import '../screen/course_detail_screen.dart' as courseDetailScreen;
import '../screen/course_list_screen.dart' as courseListScreen;
import '../screen/course_register_screen.dart' as courseRegisterScreen;
import '../screen/course_register_success_screen.dart'
    as courseRegisterSuccessScreen;
import '../screen/history_screen.dart' as historyScreen;

Future<void> gotoCourseDetail(tester, courseTitle) async {
  await courseListScreen.verifyIsCourseListScreen(tester);
  await courseListScreen.clickTargetCourse(tester, courseTitle);
}

Future<void> clickRegister(tester) async {
  await courseDetailScreen.clickRegister(tester);
}

Future<void> enterRegisterInfo(tester, id, name, email) async {
  await tester.pumpAndSettle();
  await courseRegisterScreen.enterEmpID(tester, id);
  await courseRegisterScreen.enterEmpName(tester, name);
  await courseRegisterScreen.enterEmpEmail(tester, email);
  await courseRegisterScreen.clickRegister(tester);
}

Future<void> verifyRegisterCourseSuccess(tester, courseTitle) async {
  await courseRegisterSuccessScreen.verifySuccessScreen(tester);
  await courseRegisterSuccessScreen.clickBack(tester);
}

Future<void> goToAndVerifyCourseRegisterHistory(tester, courseTitle) async {
  await courseListScreen.clickMenuBtn(tester);
  await courseListScreen.clickSubMenu(tester, 'History');
  await historyScreen.verifyIsHistoryScreenTitle(tester);
  await historyScreen.verifyCourseRegisteredIsDisplay(tester, courseTitle);
}
