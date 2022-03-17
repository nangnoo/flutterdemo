// Imports the Flutter Driver API.
@Tags(['integration'])

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final txtCounter = find.byValueKey('txtCounter');
    final btnPlus = find.byValueKey('btnPlus');
    final title = find.byValueKey('title');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(txtCounter), "10");
    });

    test('increments the counter', () async {
      await driver.tap(btnPlus);
      expect(await driver.getText(txtCounter), "1");
    });

    test('increments the counter1', () async {
      await driver.tap(btnPlus);
      expect(await driver.getText(txtCounter), "2");
    });

    test('increments the counter2', () async {
      expect(await driver.getText(title),
          'You have pushed the button this many times:');
    });
  });
}
