import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_calculator/app/shared/components/keyboard/keyboard_widget.dart';

main() {
  testWidgets('KeyboardWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(KeyboardWidget()));
    final textFinder = find.text('Keyboard');
    expect(textFinder, findsOneWidget);
  });
}
