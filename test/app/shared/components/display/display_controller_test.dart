import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_calculator/app/shared/components/display/display_controller.dart';
import 'package:flutter_calculator/app/app_module.dart';

void main() {
  initModule(AppModule());
  DisplayController display;

  setUp(() {
    display = AppModule.to.get<DisplayController>();
  });

  group('DisplayController Test', () {
    test("First Test", () {
      expect(display, isInstanceOf<DisplayController>());
    });

    test("Set Value", () {
      expect(display.value, equals(0));
      display.increment();
      expect(display.value, equals(1));
    });
  });
}
