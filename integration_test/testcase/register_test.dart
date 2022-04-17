import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;
import '../keyword/feature/login.dart' as loginFeature;
import '../keyword/feature/course_management.dart' as courseManageFeature;
import '../utils/common.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // - flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/register_test.dart

  testWidgets("TECHQA-005 Register Unix success", (WidgetTester tester) async {
    app.main();
    await loginFeature.enterDataAndLoginSuccess(tester, 'qa', '112233');
    await courseManageFeature.gotoCourseDetail(tester, 'Basic Unix');
    await courseManageFeature.clickRegister(tester);
    await courseManageFeature.enterRegisterInfo(
        tester, 's88225', 'Kanittha Harn', 'email@email.com');
    await courseManageFeature.verifyRegisterCourseSuccess(tester, 'Basic Unix');
    await courseManageFeature.goToAndVerifyCourseRegisterHistory(
        tester, 'Basic Unix');
  }, tags: ['regression'], skip: testFilters('#regression'));
}
